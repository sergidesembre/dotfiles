#!/bin/bash

function generateAllKeys()
{
    for sshKeysToRegister in ~/.dotfiles/scripts/ssh/*; do
        generateKey "${sshKeysToRegister}"
    done
}

function generateKey()
{
    SSH_NAME="$(echo ${1} | rev | cut -d'/' -f1 | rev | cut -d'.' -f1)";
    echo -e "\e[32mGenerating new SSH keys for ${SSH_NAME}\e[0m"
    ssh-keygen -t rsa -b 4096 -C "${SSH_NAME}" -f ~/.ssh/${SSH_NAME} -q -N ''

    echo -e '\e[32mStarting the SSH agent\e[0m'
    eval "$(ssh-agent -s)"

    echo -e '\e[32mAdding your key to the SSH agent\e[0m'
    ssh-add ~/.ssh/${SSH_NAME}

    displayPublicKey ${SSH_NAME}
}

function displayPublicKey()
{
    echo -e "\e[32mShow your public key from ${1}\e[0m"
    cat ~/.ssh/$1.pub
}

function guardFileExist()
{
    if [ ! -f "$HOME/.dotfiles/scripts/ssh/$1.host" ]
    then
        echo "File $HOME/.dotfiles/scripts/ssh/$1.host doesn\'t not exist"
        exit 1
    fi
}

function menu()
{
    for sshKeysToRegister in ~/.dotfiles/scripts/ssh/*; do
        SSH_NAME="$(echo ${sshKeysToRegister} | rev | cut -d'/' -f1 | rev | cut -d'.' -f1)";
        echo -e "   \e[32m./ssh.sh ${SSH_NAME}\e[0m  - generate SSH keys for ${SSH_NAME}"
    done

    echo -e "   \e[32m./ssh.sh public-key [ssh_name]\e[0m  - display public key by SSH name"
}


case $1 in
    all )
        generateAllKeys
        ;;
    public-key )
        guardFileExist $2
        displayPublicKey $2
        ;;
    * )
        if [ ! -z "$1" ]
        then
            guardFileExist $1
            generateKey "$1.host"
        else
            menu
        fi
        ;;

esac
