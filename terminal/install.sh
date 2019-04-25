#!/bin/bash

DOTFILES_TERMINAL_PATH=$HOME/.dotfiles/terminal

mkdir -p $HOME/.config/zsh
ln -sf ${DOTFILES_TERMINAL_PATH}/zsh/.init_aliases $HOME/.config/zsh


