#!/bin/bash
# Configura un Mac desde cero.
# Uso: ./install.sh
set -e   # si un paso falla, el script se detiene

# Carpeta donde está este repositorio
DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# 1. Homebrew (solo si no está instalado)
if ! command -v brew >/dev/null 2>&1; then
  echo "Instalando Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 2. Herramientas y aplicaciones del Brewfile
echo "Instalando paquetes del Brewfile..."
brew bundle --file="$DOTFILES/macos/Brewfile"

# 3. Oh My Zsh (sin sobrescribir .zshrc ni abrir una shell nueva)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Instalando Oh My Zsh..."
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# 4. Plugins de Oh My Zsh
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
[ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] || \
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
[ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] || \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# 5. Tema oxide
ln -sf "$DOTFILES/zsh/themes/oxide.zsh-theme" "$ZSH_CUSTOM/themes/oxide.zsh-theme"

# 6. Carpetas locales: nvm y trabajo (fuera de git)
mkdir -p "$HOME/.nvm"
mkdir -p "$DOTFILES/work/aliases"
touch "$DOTFILES/work/env.zsh"

# 7. Enlazar .zshrc
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"

# 8. Git: configuración y perfiles (nombre y email fuera del repo)
ln -sf "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"
for dir in personal work; do
  profile="$HOME/Developer/$dir/.gitconfig.profile"
  if [ ! -f "$profile" ]; then
    mkdir -p "$HOME/Developer/$dir"
    read -r -p "Nombre para git ($dir): " name
    read -r -p "Email para git ($dir): " email
    read -r -p "Clave pública SSH para firmar ($dir) [Enter para omitir]: " signingkey
    printf '[user]\n    name = %s\n    email = %s\n' "$name" "$email" > "$profile"
    if [ -n "$signingkey" ]; then
      printf '    signingkey = key::%s\n\n[commit]\n    gpgsign = true\n' "$signingkey" >> "$profile"
    fi
  fi
done

# 9. Nano: colores para los mensajes de commit
grep -qF "$DOTFILES/git/gitmessage.nanorc" "$HOME/.nanorc" 2>/dev/null || \
  echo "include \"$DOTFILES/git/gitmessage.nanorc\"" >> "$HOME/.nanorc"

# 10. SSH: las claves las sirve el agente de 1Password
mkdir -p "$HOME/.ssh" && chmod 700 "$HOME/.ssh"
ln -sf "$DOTFILES/ssh/config" "$HOME/.ssh/config"

# 11. Ajustes de macOS
bash "$DOTFILES/macos/defaults.sh"

echo "✅ Listo. Abre una terminal nueva."
