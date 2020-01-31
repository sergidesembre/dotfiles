export ZSH="$HOME/.oh-my-zsh"

SHELLS_PATH=$HOME/.dotfiles/shells

ZSH_THEME="oxide"
ZSH_CUSTOM=$SHELLS_PATH/zsh_custom
HIST_STAMPS="yyyy/mm/dd"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting tmux)

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/.composer/vendor/bin"

# Load .profile
#[[ -e $HOME/.zsh_profile ]] && emulate sh -c 'source $HOME/.zsh_profile'

# Load aliases
ALIASES_PATH=$HOME/.dotfiles/shells/_aliases

if [ -f ${ALIASES_PATH}/general ]; then
    source ${ALIASES_PATH}/general
else
    print "404: file ${ALIASES_PATH} not found"
fi

if [ -f ${ALIASES_PATH}/docker ]; then
    source ${ALIASES_PATH}/docker
else
    print "404: file ${ALIASES_PATH} not found"
fi
