#!/bin/bash

echo -e "\e[95;1mBe careful, is required root privileges\e[0m"
sudo apt update
sudo apt install snapd

# --------------------------------
#        development tools
# --------------------------------
sudo snap install phpstorm -classic -edge
sudo snap install pycharm-community
sudo snap install postman
sudo snap install notepad-plus-plus
sudo snap install docker

# --------------------------------
#         social tools
# --------------------------------
sudo snap install slack

# --------------------------------
#         graphic tools
# --------------------------------
sudo snap install gimp

# --------------------------------
#        multimedia tools
# --------------------------------
sudo snap install spotify
sudo snap install vlc

