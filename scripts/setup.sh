#!/usr/bin/bash

# Change shell
chsh

# Go to dotfiles
cd ~/dotfiles

# Create symlinks
stow .

# Install every package which was inside your previous installations
local package_file="~/dotfiles/assets/packages.txt"
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
GRUB_FILE="/etc/default/grub"
# Check if the line is commented out
if grep -q "^#.*GRUB_DISABLE_OS_PROBER=false" "$GRUB_FILE"; then
    # Use sed to uncomment the line
    sed -i 's/^#\(GRUB_DISABLE_OS_PROBER=false\)/\1/' "$GRUB_FILE"
fi
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Create all user directories
xdg-user-dirs-update

# Syncronize system clock
timedatectl set-ntp true
timedatectl set-local-rtc 1 --adjust-system-clock

# Enable bluetooth service
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# Go back to home
cd ~

# Cliphist rofi img binary
curl -O https://raw.githubusercontent.com/sentriz/cliphist/master/contrib/cliphist-rofi-img
sudo chmod +x ~/cliphist-rofi-img

# Authenticate with GitHub
gh auth login

# Finalize setup
echo "The setup was successfully!"
echo "Press enter key to reboot..." && read && reboot
