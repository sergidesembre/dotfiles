#!/bin/bash

#---------------------#
#        ZSH          #
#---------------------#

# INSTALL ZSH SHELL
sudo apt install zsh
chsh -s $(which zsh)

#---------------------#
#     OH MY ZSH       #
#---------------------#

echo "Installing Oh My Zsh!"

./../scripts/setup-oh-my-zsh.sh
git submodule update
