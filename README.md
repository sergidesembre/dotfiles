# dotfiles

Configuración para dejar un Mac (chip Apple) listo desde cero: herramientas, aplicaciones, zsh, git y SSH.

## Instalación en un Mac nuevo

1. Inicia sesión en la **App Store** (necesario para instalar Monosnap).
2. Instala las *Command Line Tools* de Xcode (incluyen `git`):
   ```bash
   xcode-select --install
   ```
3. Clona el repositorio **en esta ruta exacta** (la usan `.zshrc` y `gitconfig`):
   ```bash
   mkdir -p ~/Developer/personal
   git clone https://github.com/sergidesembre/dotfiles.git ~/Developer/personal/dotfiles
   ```
   > Si el repositorio es **privado**: en este punto todavía no hay SSH (1Password no está instalado), así que git pedirá tu usuario de GitHub y, como contraseña, un *personal access token* (créalo en GitHub → *Settings → Developer settings → Personal access tokens*).
4. Ejecuta el instalador:
   ```bash
   cd ~/Developer/personal/dotfiles
   ./install.sh
   ```
   Te pedirá tu contraseña de macOS (Homebrew) y, para `personal` y `work`, el nombre y email de git y (opcional) la clave pública SSH para firmar commits.
5. Abre una terminal nueva. Cierra sesión y vuelve a entrar para que se apliquen los ajustes de macOS.

`install.sh` se puede volver a ejecutar sin problema: cada paso comprueba si ya está hecho.

## Qué hace `install.sh`

| Paso | Qué hace |
|---|---|
| 1 | Instala Homebrew si no está |
| 2 | Instala todo lo de `macos/Brewfile` |
| 3 | Instala Oh My Zsh |
| 4 | Descarga los plugins `zsh-autosuggestions` y `zsh-syntax-highlighting` |
| 5 | Enlaza el tema `oxide` |
| 6 | Crea `~/.nvm`, `work/aliases/` y `work/env.zsh` |
| 7 | Enlaza `~/.zshrc` → `zsh/.zshrc` |
| 8 | Enlaza `~/.gitconfig` → `git/gitconfig` y crea los perfiles de git |
| 9 | Activa los colores de nano para los commits |
| 10 | Enlaza `~/.ssh/config` (usa el agente SSH de 1Password) |
| 11 | Aplica los ajustes de macOS de `macos/defaults.sh` |

## Pasos manuales después de instalar

- **1Password** (claves SSH):
  1. Ábrelo e inicia sesión en tus cuentas personal y de empresa.
  2. Activa *Ajustes → Desarrollador → Usar el agente SSH*.
  3. Si todavía no tienes clave SSH en 1Password, créala desde la app (*Nuevo elemento → Clave SSH*) y añade la clave pública en GitHub y GitLab.
- **Commits firmados ("Verified")**: añade la misma clave pública otra vez como clave de firma:
  - GitHub: *Settings → SSH and GPG keys → New SSH key → Key type: Signing Key*.
  - GitLab: al añadir la clave, elige el uso *Authentication & Signing*.

  > ⚠️ Si diste una clave de firma en el instalador, **los commits fallarán** (error de `op-ssh-sign`) hasta que 1Password esté abierto con el agente SSH activado.
- **Docker Desktop**: ábrelo una vez y acepta las condiciones; hasta entonces `docker` no funciona.
- **JetBrains Toolbox**: inicia sesión e instala los IDEs que necesites (ver [Configuración del IDE](#configuración-del-ide-webstorm)).
- **iTerm2, Slack, WhatsApp, Spotify, Claude, Monosnap**: abrir e iniciar sesión.

## Configuración del IDE (WebStorm)

1. Abre **JetBrains Toolbox**, inicia sesión con tu cuenta de JetBrains e instala **WebStorm**.
2. Abre WebStorm y ve a *Settings → Plugins → Marketplace*.
3. Busca **Kanagawa Theme** ([página del plugin](https://plugins.jetbrains.com/plugin/19539-kanagawa-theme)) y pulsa *Install*.
4. Ve a *Settings → Appearance & Behavior → Appearance → Theme* y elige **Kanagawa**.
5. Comprueba en *Settings → Editor → Color Scheme* que el esquema del editor también es **Kanagawa** (si no, selecciónalo ahí).

## Estructura

```
dotfiles/
├── install.sh          instalador
├── macos/
│   ├── Brewfile        herramientas y aplicaciones (Homebrew y App Store)
│   └── defaults.sh     ajustes de macOS
├── zsh/
│   ├── .zshrc          configuración de zsh + Oh My Zsh
│   ├── aliases/        aliases por tema (general, git, docker, composer, npm)
│   └── themes/         tema oxide
├── git/
│   ├── gitconfig       configuración global de git
│   ├── ignore          ignore global
│   ├── message         plantilla de commit
│   └── gitmessage.nanorc  colores de nano para los commits
├── ssh/config          configuración SSH (agente de 1Password)
└── work/               solo local, ignorado por git
```

## Configuración del trabajo (`work/`)

`work/` nunca se sube al repositorio. Sirve para lo que es solo del trabajo:

- `work/env.zsh`: variables de entorno (`export MI_VARIABLE="valor"`).
- `work/aliases/`: cualquier archivo aquí se carga como aliases.

## Perfiles de git

El nombre, el email y la clave de firma no están en el repo. Se guardan en:

- `~/Developer/personal/.gitconfig.profile` → repos dentro de `~/Developer/personal/`
- `~/Developer/work/.gitconfig.profile` → repos dentro de `~/Developer/work/`

## Añadir una aplicación o herramienta

Añade una línea a `macos/Brewfile` (`brew "nombre"` para herramientas de terminal, `cask "nombre"` para aplicaciones, `mas "Nombre", id: 123` para apps de la App Store) y ejecuta:

```bash
brew bundle --file=macos/Brewfile
```
