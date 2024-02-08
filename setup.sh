#!/bin/zsh

# Create sym links
cd ~/dotfiles/
stow .
stow -t /etc etc

# Install pacman packages
if [[ -f "./installation/installed_packages.txt" ]]; then
  sudo pacman -S --needed - < "./installation/installed_packages.txt"
else
  echo "No installed packages file found!"
fi
