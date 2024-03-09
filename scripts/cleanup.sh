#!/usr/bin/zsh

# Dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"

# Find symbolic links inside home directory
find "$HOME" -type l | while read -r symlink; do
    # Get the target of the symbolic link
    target=$(readlink "$symlink")

    # Check if the target points inside dotfiles directory
    if [[ "$target" == "$DOTFILES_DIR"* ]] && [ ! -e "$target" ]; then
        # Remove the symbolic link
        echo "Removing broken symlink: $symlink"
        unlink "$symlink"
    fi
done
