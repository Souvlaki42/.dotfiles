#!/bin/bash

# Environment Variables
DOTFILES_DIR="$HOME/dotfiles"
SYMLINKS_FILE="$DOTFILES_DIR/symlinks.json"

# Flag files for certain programs
NVM_FLAG_FILE="$DOTFILES_DIR/flags/.nvm_is_already_here"
TPM_FLAG_FILE="$DOTFILES_DIR/flags/.tpm_is_already_here"

# Install through this file
sudo pacman -S --needed - < "$DOTFILES_DIR/installation/installed_packages.txt"

# Git clone TPM (Tmux Package Manager)
if [ ! -e "$TPM_FLAG_FILE" ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	touch "$TPM_FLAG_FILE"
fi

# Curl NVM (Node Version Manager)
if [ ! -e "$NVM_FLAG_FILE" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
	touch "$NVM_FLAG_FILE"
fi

# Font
sudo pacman -Sy --needed ttf-jetbrains-mono-nerd

# Yay bin
sudo pacman -S --needed git base-devel
mkdir "$HOME/.local/bin"
git clone https://aur.archlinux.org/yay-bin.git "$HOME/.local/bin/yay-bin"
cd "$HOME/.local/bin/yay-bin"
makepkg -si
cd $HOME
yay -Sy --needed wlogout swaylock-effects visual-studio-code-bin waybar-updates bibata-cursor-theme-bin 

# Parse the JSON file and create symlinks
for item in $(jq -c ".[]" "$SYMLINKS_FILE"); do
    relative_path=$(echo "$item" | jq -r ".relative_path")
    absolute_path=$(echo "$item" | jq -r ".absolute_path")
    type=$(echo "$item" | jq -r ".type")

    # Prepend home to absolute path when it's not really absolute
    if [[ "$absolute_path" != /* ]]; then
        absolute_path="${HOME}/${absolute_path}"
    fi

    # Ensure the directory structure exists for the file
   sudo mkdir -p "$(dirname "$absolute_path")"

    if [ "$type" = "file" ]; then
        sudo rm -f "$absolute_path"
        sudo ln -s "$DOTFILES_DIR/$relative_path" "$absolute_path"
    elif [ "$type" = "directory" ]; then
        sudo rm -rf "$absolute_path"
        sudo ln -s "$DOTFILES_DIR/$relative_path" "$absolute_path"
    fi
done

# Bashrc
source "$HOME/.bashrc"

# Clock
timedatectl set-ntp true
timedatectl set-local-rtc 1 --adjust-system-clock

# Bluetooth
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
