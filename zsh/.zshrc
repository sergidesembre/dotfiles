# Ruta del repositorio dotfiles
export DOTFILES="$HOME/Developer/personal/dotfiles"

# Homebrew (Mac con chip Apple)
eval "$(/opt/homebrew/bin/brew shellenv)"

# Variables de entorno del trabajo (solo local, fuera de git)
[ -f "$DOTFILES/work/env.zsh" ] && source "$DOTFILES/work/env.zsh"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="oxide"
HIST_STAMPS="yyyy/mm/dd"
plugins=(git docker docker-compose zsh-autosuggestions zsh-syntax-highlighting)   # syntax-highlighting siempre el último
source "$ZSH/oh-my-zsh.sh"

# Composer: binarios globales
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Aliases personales y del trabajo
for f in "$DOTFILES"/zsh/aliases/*(N); do source "$f"; done
for f in "$DOTFILES"/work/aliases/*(N); do source "$f"; done
