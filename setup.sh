#!/usr/bin/zsh

# Create sym links
cd ~/dotfiles/
stow .
chsh /usr/bin/zsh

# Install pacman packages
if [[ -f "./installation/installed_packages.txt" ]]; then
  sudo pacman -S --needed - < "./installation/installed_packages.txt"
else
  echo "No installed packages file found!"
fi

cat yay_packages.txt | xargs yay -S --needed --noconfirm
