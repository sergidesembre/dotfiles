#!/bin/bash
# Aplica los hosts personales y del trabajo en /etc/hosts
# Uso: ./hosts/apply.sh   (pide la contraseña de macOS)
set -e

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"
START="# >>> dotfiles >>>"
END="# <<< dotfiles <<<"
TMP="$(mktemp)"

# 1. Copia de /etc/hosts sin el bloque anterior
sed "/^$START\$/,/^$END\$/d" /etc/hosts > "$TMP"

# 2. Bloque nuevo con los hosts personales y del trabajo
{
  echo "$START"
  echo "# Personal"
  cat "$DOTFILES/hosts/personal"
  if [ -f "$DOTFILES/work/hosts" ]; then
    echo "# Trabajo"
    cat "$DOTFILES/work/hosts"
  fi
  echo "$END"
} >> "$TMP"

# 3. Guardar (con copia de seguridad) y limpiar la caché DNS
sudo cp /etc/hosts /etc/hosts.bak
sudo cp "$TMP" /etc/hosts
rm "$TMP"
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder

echo "✅ /etc/hosts actualizado"
