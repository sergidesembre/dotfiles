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
    ln -sf $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
    echo -e "\e[1;42m OK \e[0m"
  fi
}

add_custom_aliases()
{
  if ask_question 'Add custom aliases'; then
    ln -sf $HOME/.dotfiles/git/gitconfig.aliases $HOME/.config/git/gitconfig.aliases
    echo -e "\e[1;42m OK \e[0m"
  fi
}

add_global_ignore()
{
  if ask_question 'Add global ignore files'; then
    ln -sf $HOME/.dotfiles/git/gitconfig.ignore $HOME/.config/git/gitconfig.ignore
    echo -e "\e[1;42m OK \e[0m"
  fi
}

add_custom_commit_message()
{
  if ask_question 'Add custom commit message'; then
    mkdir -p $HOME/.config/nano
    ln -sf $HOME/.dotfiles/git/gitconfig.message $HOME/.config/git/gitconfig.message
    ln -sf $HOME/.dotfiles/git/editor/nano/gitmessage.nanorc $HOME/.config/nano/gitmessage
    echo "include $HOME/.config/nano/gitmessage" >> $HOME/.nanorc

    echo -e "\e[1;42m OK \e[0m"
  fi
}

add_configuration_profile()
{
  if ask_question 'Add configuration profile GitHub in "~/Code/me/"'; then
    mkdir -p $HOME/Code/me
    ln -sf $HOME/.dotfiles/git/profiles/gitconfig.github.profile $HOME/Code/me/.gitconfig.profile
    echo -e "\e[1;42m OK \e[0m"
  fi

  if ask_question 'Add configuration profile GitLab in "~/Code/work/"'; then
    mkdir -p $HOME/Code/work
    ln -sf $HOME/.dotfiles/git/profiles/gitconfig.gitlab.profile $HOME/Code/work/.gitconfig.profile
    echo -e "\e[1;42m OK \e[0m"
  fi
}

add_ssh_configuration()
{
  if ask_question 'Add SSH configuration by hostname (GitHub and GitLab)'; then
    mkdir -p ~/.ssh/github ~/.ssh/gitlab
    ln -sf $HOME/.dotfiles/git/ssh/hosts.config $HOME/.ssh/git.hosts
    echo -e "\e[1;42m OK \e[0m"
  fi
}

###
# Starts here
###
mkdir -p $HOME/.config/git

install_git
set_custom_configuration
add_custom_aliases
add_global_ignore
add_custom_commit_message
add_configuration_profile
add_ssh_configuration