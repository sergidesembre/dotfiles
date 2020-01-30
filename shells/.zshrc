export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="oxide"

HIST_STAMPS="yyyy/mm/dd"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/.composer/vendor/bin"

# Load .profile
[[ -e $HOME/.zsh_profile ]] && emulate sh -c 'source $HOME/.zsh_profile'


source ~/.custom/_config_zsh
source ~/.config/zsh/.init_aliases

# Load aliases
ALIASES_PATH=$HOME/.dotfiles/shells/_aliases

if [ -f ${ALIASES_PATH}/general ]; then
    source ${ALIASES_PATH}/general
else
    print "404: file ${ALIASES_PATH} not found"
fi
