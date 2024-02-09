# This is the start of my zshrc configuration file in Arch Linux

# Environment variables
TERM="xterm-256color"
DOTFILES_DIR="$HOME/dotfiles"
PROMPT="%F{blue}%~%f %F{green}>%f "
EDITOR="nvim"

# Aliases
source "$DOTFILES_DIR/scripts/aliases.sh"

# Commands
source "$DOTFILES_DIR/scripts/commands.sh"

# Paths
source "$DOTFILES_DIR/scripts/paths.sh"

# TMUX
source "$DOTFILES_DIR/scripts/tmux.sh"
