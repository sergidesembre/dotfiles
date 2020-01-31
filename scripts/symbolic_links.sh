#!/bin/bash

ln -sf $HOME/.dotfiles/git/.gitmessage $HOME
ln -sf $HOME/.dotfiles/git/.gitconfig.aliases $HOME
ln -sf $HOME/.dotfiles/git/.gitignore_global $HOME
ln -sf $HOME/.dotfiles/git/.gitconfig $HOME

ln -sf $HOME/.dotfiles/terminal/zsh/.init_aliases $HOME/.config/zsh

#---------------------#
#        GIT          #
#---------------------#

ln -sf ${DOTFILES_GIT_PATH}/.gitmessage $HOME
ln -sf ${DOTFILES_GIT_PATH}/.gitignore_global $HOME
ln -sf ${DOTFILES_GIT_PATH}/.gitconfig $HOME
