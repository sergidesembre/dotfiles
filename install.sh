#!/bin/sh

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

echo 'Generating GitHub SSH key'
ssh-keygen -t rsa -C 'github' -f ~/.ssh/github -q -N ''
echo 'Host github.com\n  HostName github.com\n  IdentityFile ~/.ssh/github' >> ~/.ssh/config

echo 'Generating Bitbucket SSH key'
ssh-keygen -t rsa -C 'bitbucket' -f ~/.ssh/bitbucket -q -N ''
echo 'Host bitbucket.org\n  HostName bitbucket.org\n  IdentityFile ~/.ssh/bitbucket' >> ~/.ssh/config
