  GNU nano 2.5.3                          File: ../.zshrc                                                           

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

HIST_STAMPS="yyyy/mm/dd"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/.composer/vendor/bin"

# Load .profile
[[ -e $HOME/.zsh_profile ]] && emulate sh -c 'source $HOME/.zsh_profile'


source ~/.custom/_config_zsh
source ~/.config/zsh/.init_aliases

