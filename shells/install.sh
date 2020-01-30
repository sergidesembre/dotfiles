#!/bin/bash

DOTFILES_SHELLS_PATH=$HOME/.dotfiles/shells
ZSH_PLUGINS=$HOME/.oh-my-zsh/custom/plugins

# INSTALL ZSH SHELL
sudo apt install zsh
chsh -s $(which zsh)

echo "Installing Oh My Zsh!"
./../scripts/setup-oh-my-zsh.sh

echo "Log out and log in back again to use your new default shell"

ln -sf ${DOTFILES_SHELLS_PATH}/.zshrc ${HOME}/.zshrc
