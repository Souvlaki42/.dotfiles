#!/bin/bash

cd ~
rm -rf ~/.dotfiles/
sudo apt-get install git -y
sudo apt-get install curl -y
git clone https://github.com/Souvlaki42/.dotfiles.git
cd ~/.dotfiles/scripts/
mkdir ~/.config/tmux/

timedatectl set-local-rtc 1 --adjust-system-clock

source ./remove_dotfiles.sh

source ./link_dotfiles.sh

fc-cache -f -v
source ~/.bashrc
source ~/.profile

source ./install.sh

source ~/.bashrc
source ~/.profile

source ./git_auth.sh

source ./terminal.sh
