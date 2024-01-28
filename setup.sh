#!/bin/bash

# Environment Variables
DOTFILES_DIR="$HOME/dotfiles"
SYMLINKS_FILE="$DOTFILES_DIR/symlinks.json"

# Install through this file
sudo pacman -S --needed - < "$DOTFILES_DIR/installation/installed_packages.txt"

# Git clone TPM (Tmux Package Manager)
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Parse the JSON file and create symlinks
for item in $(jq -c '.[]' "$SYMLINKS_FILE"); do
    relative_path=$(echo "$item" | jq -r '.relative_path')
    absolute_path=$(echo "$item" | jq -r '.absolute_path')
    type=$(echo "$item" | jq -r '.type')

    # Prepend home to absolute path when it's not really absolute
    if [[ "$absolute_path" != /* ]]; then
        absolute_path="${HOME}/${absolute_path}"
    fi

    # Ensure the directory structure exists for the file
    mkdir -p "$(dirname "$absolute_path")"

    if [ "$type" = "file" ]; then
        rm -f "$absolute_path"
        ln -s "$DOTFILES_DIR/$relative_path" "$absolute_path"
    elif [ "$type" = "directory" ]; then
        rm -rf "$absolute_path"
        ln -s "$DOTFILES_DIR/$relative_path" "$absolute_path"
    fi
done

# Bashrc
source "$HOME/.bashrc"
