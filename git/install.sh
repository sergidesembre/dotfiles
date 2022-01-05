#!/bin/sh

ask_question()
{
  read -p "$1 (y/n)[y]: " ask_response

  if [ "$ask_response" = "n" ]; then
    return 1
  fi
  return 0
}

install_git()
{
  if ask_question 'Install git'; then
    sudo apt install git
    echo -e "\e[1;42m OK \e[0m"
  fi
}

set_custom_configuration()
{
  if ask_question 'Set custom git configuration'; then
    ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig
    echo -e "\e[1;42m OK \e[0m"
  fi
}

add_custom_aliases()
{
  if ask_question 'Add custom aliases'; then
    ln -sf ~/.dotfiles/git/.gitconfig.aliases ~/.gitconfig.aliases
    echo -e "\e[1;42m OK \e[0m"
  fi
}

add_global_ignore()
{
  if ask_question 'Add global ignore files'; then
    ln -sf ~/.dotfiles/git/.gitignore.global ~/.gitignore.global
    echo -e "\e[1;42m OK \e[0m"
  fi
}

add_custom_commit_message()
{
  if ask_question 'Add custom commit message'; then
    ln -sf ~/.dotfiles/git/.gitmessage ~/.gitmessage
    echo -e "\e[1;42m OK \e[0m"
  fi
}

add_configuration_profile()
{
  if ask_question 'Add configuration profile GitHub in "~/Code/me/"'; then
    ln -sf ~/.dotfiles/git/profiles/.gitconfig.github.profile ~/Code/me/.gitconfig.profile
    echo -e "\e[1;42m OK \e[0m"
  fi

  if ask_question 'Add configuration profile GitLab in "~/Code/work/"'; then
    ln -sf ~/.dotfiles/git/profiles/.gitconfig.gitlab.profile ~/Code/work/.gitconfig.profile
    echo -e "\e[1;42m OK \e[0m"
  fi
}

add_ssh_configuration()
{
  if ask_question 'Add SSH configuration by hostname (GitHub and GitLab)'; then
    mkdir ~/.ssh/github ~/.ssh/gitlab
    ln -sf ~/.dotfiles/git/git.hosts ~/.ssh/git.hosts
    echo -e "\e[1;42m OK \e[0m"
  fi
}

###
# Starts here
###
install_git
set_custom_configuration
add_custom_aliases
add_global_ignore
add_custom_commit_message
add_configuration_profile
add_ssh_configuration