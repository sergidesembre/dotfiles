#!/bin/sh

DOTFILES_DEVELOPMENT_PATH=$HOME/.dotfiles/development

__checkEmptyFolder()
{
    if [ "$(ls -A ${DOTFILES_DEVELOPMENT_PATH}/$1)" ]; then
        return 0
    else
        return 1
    fi
}

# GIT
mkdir -p $HOME/.git
ln -sf ${DOTFILES_DEVELOPMENT_PATH}/git/.gitconfig $HOME
ln -sf ${DOTFILES_DEVELOPMENT_PATH}/git/.gitignore_global $HOME
ln -sf ${DOTFILES_DEVELOPMENT_PATH}/git/.gitmessage $HOME

# PHP
mkdir -p $HOME/.composer
ln -sf ${DOTFILES_DEVELOPMENT_PATH}/languages/php/composer.json $HOME/.composer

# Register exposrts
__checkEmptyFolder terminal/_exports
if [ "$?" -eq "0" ]; then
    for exportsToRegister in ${DOTFILES_DEVELOPMENT_PATH}/terminal/_exports/*; do
        source $exportsToRegister;
    done
fi

# Register aliasses
__checkEmptyFolder terminal/_aliasses
if [ "$?" -eq "0" ]; then
    for aliassesToRegister in ${DOTFILES_DEVELOPMENT_PATH}/terminal/_aliasses/*; do
        source $aliassesToRegister;
    done
fi
