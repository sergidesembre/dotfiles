#!/bin/bash

function addToCrontabTasks()
{
    echo -e "\e[32mAdding crontab tasks from crontab.cron file\e[0m"
    crontab ${HOME}/.dotfiles/scripts/cron/crontab.cron
}

function listSystemCrontab() {
    echo -e "\e[32mCurrent crontab tasks into the system:\e[0m"
    crontab -l
}

addToCrontabTasks
listSystemCrontab