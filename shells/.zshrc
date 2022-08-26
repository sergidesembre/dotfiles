export ZSH="$HOME/.oh-my-zsh"

SHELLS_PATH=$HOME/.dotfiles/shells

ZSH_THEME="oxide"
ZSH_CUSTOM=$SHELLS_PATH/zsh_custom
HIST_STAMPS="yyyy/mm/dd"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker docker-compose)

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/.composer/vendor/bin"

# Load .profile
#[[ -e $HOME/.zsh_profile ]] && emulate sh -c 'source $HOME/.zsh_profile'

function loadAliasesFromFolder()
{
    for aliasFile in ${1}/*; do
        source ${aliasFile}
    done
}

# Load development aliases
if [ -f ${SHELLS_PATH}/../development/languages/php/aliases ]; then
    source ${SHELLS_PATH}/../development/languages/php/aliases
else
    echo -e "\e[31mFile ${SHELLS_PATH}/../development/languages/php/aliases not found\e[0m"
fi

# Load aliases
loadAliasesFromFolder $SHELLS_PATH/_aliases

# Load work aliases
loadAliasesFromFolder $HOME/.dotfiles/work/_aliases