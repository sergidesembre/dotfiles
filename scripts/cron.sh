#!/bin/bash

function addAllCrontabs()
{
    for cronsToRegister in ~/.dotfiles/scripts/cron/*.cron; do
        addToCrontab "${cronsToRegister}"
    done
}

function addToCrontab()
{
    CRON_NAME="$(echo ${1} | rev | cut -d'/' -f1 | rev | cut -d'.' -f1)";
    echo -e "\e[32mAdding tasks ${CRON_NAME} to crontab\e[0m"
    crontab ~/.dotfiles/scripts/cron/${CRON_NAME}.cron
}

function watchTask()
{
    echo -e "\e[32mCron tasks '${1}':\e[0m"
    cat ~/.dotfiles/scripts/cron/${1}.cron
}

function guardFileExist()
{
    if [ ! -f "$HOME/.dotfiles/scripts/cron/$1.cron" ]
    then
        echo "File $HOME/.dotfiles/scripts/cron/$1.cron doesn\'t not exist"
        exit 1
    fi
}

function menu()
{
    for cronsToRegister in ~/.dotfiles/scripts/cron/*.cron; do
        CRON_NAME="$(echo ${cronsToRegister} | rev | cut -d'/' -f1 | rev | cut -d'.' -f1)";
        echo -e "   \e[32m./cron.sh ${CRON_NAME}\e[0m  - add to crontab task ${CRON_NAME}"
    done

    echo -e "   \e[32m./cron.sh cron [cron_name]\e[0m  - display cron task by cron name"
}

case $1 in
    all )
        addAllCrontabs
        ;;
    cron )
        guardFileExist $2
        watchTask $2
        ;;
    * )
        if [ ! -z "$1" ]
        then
            guardFileExist $1
            addToCrontab "$1.cron"
        else
            menu
        fi
        ;;

esac
