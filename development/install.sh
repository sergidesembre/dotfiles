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

# TERMINAL
echo 'Installing nano terminal configuration...'
mkdir -p $HOME/.config/nano
ln -sf ${DOTFILES_DEVELOPMENT_PATH}/terminal/nano/gitcommit.nanorc $HOME/.config/nano
ln -sf ${DOTFILES_DEVELOPMENT_PATH}/terminal/nano/.nanorc $HOME

# PHP
echo 'Installing composer configuration...'
mkdir -p $HOME/.composer
ln -sf ${DOTFILES_DEVELOPMENT_PATH}/languages/php/composer.json $HOME/.composer

# Register exports
echo 'Registering export vars...'
__checkEmptyFolder terminal/_exports
if [ "$?" -eq "0" ]; then
    for exportsToRegister in ${DOTFILES_DEVELOPMENT_PATH}/terminal/_exports/*; do
        source $exportsToRegister;
    done
fi

# Register aliases
echo 'Registering aliases...'
__checkEmptyFolder terminal/_aliases
if [ "$?" -eq "0" ]; then
    for aliasesToRegister in ${DOTFILES_DEVELOPMENT_PATH}/terminal/_aliases/*; do
        source $aliasesToRegister;
    done
fi
