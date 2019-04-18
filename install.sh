#!/bin/sh

DOTFILES_PATH=$HOME/.dotfiles
DOTFILES_GIT_PATH=${DOTFILES_PATH}/git

#---------------------#
#      LANGUAGES      #
#---------------------#
echo 'Install development tools:';
source ${DOTFILES_PATH}/development/install.sh

#---------------------#
#        GIT          #
#---------------------#
echo 'Installing git features...'
mkdir -p $HOME/.git
ln -sf ${DOTFILES_GIT_PATH}/.gitmessage $HOME
ln -sf ${DOTFILES_GIT_PATH}/.gitconfig.aliases $HOME
ln -sf ${DOTFILES_GIT_PATH}/.gitignore_global $HOME
ln -sf ${DOTFILES_GIT_PATH}/.gitconfig $HOME

