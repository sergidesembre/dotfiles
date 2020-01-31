#!/bin/bash

#---------------------#
#        ZSH          #
#---------------------#

DOTFILES_SHELLS_PATH=${HOME}/.dotfiles/shells
ln -sf ${DOTFILES_SHELLS_PATH}/.zshrc ${HOME}/.zshrc

#---------------------#
#        GIT          #
#---------------------#

DOTFILES_GIT_PATH=${HOME}/.dotfiles/git
ln -sf ${DOTFILES_GIT_PATH}/.gitmessage ${HOME}
ln -sf ${DOTFILES_GIT_PATH}/.gitignore_global ${HOME}
ln -sf ${DOTFILES_GIT_PATH}/.gitconfig ${HOME}
