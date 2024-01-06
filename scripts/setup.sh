#!/bin/bash

cd ~
rm -rf ~/.dotfiles/
sudo apt-get install git -y
git clone https://github.com/Souvlaki42/.dotfiles.git
cd ~/.dotfiles/scripts/

timedatectl set-local-rtc 1 --adjust-system-clock

source ./terminal.sh

source ./remove_dotfiles.sh

source ./create_dotfiles.sh

source ./link_dotfiles.sh

source ./install.sh

source ./git_auth.sh
