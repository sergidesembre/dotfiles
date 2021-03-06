#!/bin/bash

DOTFILES_PATH=$HOME/.dotfiles
DOTFILES_GIT_PATH=${DOTFILES_PATH}/git

# Create folders
mkdir -p $HOME/.git
mkdir -p $HOME/Code/work
mkdir -p $HOME/Code/me

#---------------------#
#      LANGUAGES      #
#---------------------#
echo 'Install development tools:';
source ${DOTFILES_PATH}/development/install.sh

#---------------------#
#        GIT          #
#---------------------#
echo 'Installing git features...'
ln -sf ${DOTFILES_GIT_PATH}/.gitmessage $HOME
ln -sf ${DOTFILES_GIT_PATH}/.gitconfig.aliases $HOME
ln -sf ${DOTFILES_GIT_PATH}/.gitignore_global $HOME
ln -sf ${DOTFILES_GIT_PATH}/.gitconfig $HOME

# Generate SSH Keys
for sshKeysToRegister in ${DOTFILES_GIT_PATH}/ssh-hosts/*; do
    SSH_NAME="$(echo ${sshKeysToRegister} | rev | cut -d'/' -f1 | rev | cut -d'.' -f1)";
    ssh-keygen -t rsa -C '${SSH_NAME}' -f ~/.ssh/${SSH_NAME} -q -N ''
    cat $sshKeysToRegister >> ~/.ssh/config;
done

#---------------------#
#      TERMINALS      #
#---------------------#
echo 'Installing custom terminals...'
source ${DOTFILES_PATH}/terminal/install.sh
