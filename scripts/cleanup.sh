#!/usr/bin/zsh

# Check if the dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Dotfiles directory not found: $DOTFILES_DIR"
    exit 1
fi

# Function to delete symbolic links
function delete_symlinks() {
    local target_dir="$1"
    local symlink

    # Iterate over symbolic links in the target directory
    for symlink in "$target_dir"/*; do
        # Check if the symlink points to a non-existent file or directory in dotfiles directory
        if [ -L "$symlink" ] && [ ! -e "$symlink" ] || [ "$(readlink -f "$symlink")" = "$DOTFILES_DIR"* ]; then
            echo "Deleting symlink: $symlink"
            rm "$symlink"
        fi
    done
}

# Delete symlinks in the dotfiles directory
delete_symlinks "$DOTFILES_DIR"

# Check if the .stow-local-ignore file exists
if [ -f "$DOTFILES_DIR/.stow-local-ignore" ]; then
    # Read the .stow-local-ignore file line by line
    while IFS= read -r ignored_item; do
        # Delete symlinks for ignored items
        delete_symlinks "$HOME/$ignored_item"
    done < "$DOTFILES_DIR/.stow-local-ignore"
fi

echo "Symlinks cleanup completed."
