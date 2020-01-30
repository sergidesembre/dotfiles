#!/bin/bash

DOTFILES_SHELLS_PATH=$HOME/.dotfiles/shells
ZSH_PLUGINS=$HOME/.oh-my-zsh/custom/plugins

# INSTALL ZSH SHELL
sudo apt install zsh
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_PLUGINS}/zsh-autosuggestions
echo "Log out and log in back again to use your new default shell"

ln -sf ${DOTFILES_SHELLS_PATH}/.zshrc ${HOME}/.zshrc
