#!/bin/zsh

PACMAN_PACKAGES_FILE="/home/souvlaki42/dotfiles/installation/pacman-packages.txt"
sudo pacman -Qqen > "$PACMAN_PACKAGES_FILE"
echo "Pacman packages updated successfully!"
