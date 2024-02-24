#!/usr/bin/bash

# Change shell
chsh

# Go to dotfiles
cd ~/dotfiles

# Create symlinks
stow .

# Install every package which was inside your previous installations
local package_file="~/dotfiles/packages.txt"
if [[ -f "$package_file" ]]; then
  while read -r package; do
    sudo paru -Sy "$package" || {
      echo "Failed to install package: $package"
    }
  done < "$package_file"
  echo "Packages were restored successfully!"
else
  echo "Package file not found: $package_file"
  return 1
fi

# Update GRUB's configuration
sudo mkconfig -o /boot/grub/grub.cfg

# Create all user directories
xdg-user-dirs-update

# Syncronize system clock
timedatectl set-ntp true
timedatectl set-local-rtc 1 --adjust-system-clock

# Enable bluetooth service
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# Go to home and finalize
echo "The setup was successfully!"
echo "Next step: reboot"
