#!/bin/bash

DOTFILES_SCRIPTS_PATH=$HOME/.dotfiles/scripts

function display {
    echo -e "$1\n"
}

function createDirectories()
{
    display '📂  \e[32mCreating directories\e[0m'
    . ${DOTFILES_SCRIPTS_PATH}/dir.sh
}

function createSymbolicLinks()
{
    display '🔗  \e[32mCreating symbolic links\e[0m'
    . ${DOTFILES_SCRIPTS_PATH}/link.sh
}

function scheduleCrontabTasks()
{
    display '📅  \e[32mScheduling crontab tasks\e[0m'
    crontab ${DOTFILES_SCRIPTS_PATH}/cron.txt
}

function generateSshKeys()
{
    display '🔑  \e[32mGenerating SSH Keys\e[0m'
    . ${DOTFILES_SCRIPTS_PATH}/ssh.sh all
}

function installApplications()
{
    display '💻  \e[32mInstalling Applications\e[0m'
    . ${DOTFILES_SCRIPTS_PATH}/app.sh
}

function runAll()
{
    createDirectories
    createSymbolicLinks
    scheduleCrontabTasks
    generateSshKeys
    installApplications
}

function menu()
{
    echo -e '\e[33;1mUsage:\e[0m'
    echo -e '   \e[32m./install.sh dir\e[0m  - create custom directories'
    echo -e '   \e[32m./install.sh link\e[0m - create symbolic links'
    echo -e '   \e[32m./install.sh cron\e[0m - update crontab tasks'
    echo -e '   \e[32m./install.sh ssh\e[0m  - generate SSH keys'
    echo -e '   \e[32m./install.sh app\e[0m  - install default appliations'
    echo -e '\e[33;1mSSH keys usage:\e[0m'
    . ${DOTFILES_SCRIPTS_PATH}/ssh.sh
    echo -e '\e[33;1mCrons usage:\e[0m'
    . ${DOTFILES_SCRIPTS_PATH}/cron.sh

}

case $1 in
    dir )
        createDirectories
        ;;
    link )
        createSymbolicLinks
        ;;
    cron )
        scheduleCrontabTasks
        ;;
    app )
        installApplications
        ;;
    all )
        runAll
        ;;
    * )
        menu
        ;;

esac
