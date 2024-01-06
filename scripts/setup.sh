#!/bin/bash

timedatectl set-local-rtc 1 --adjust-system-clock

echo "Github authentication token?"
read token

source ./install.sh

echo $token | gh auth login --with-token

source ./terminal.sh

source ./remove_dotfiles.sh

source ./create_dotfiles.sh

source ./link_dotfiles.sh
