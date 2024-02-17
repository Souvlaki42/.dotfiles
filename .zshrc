# This is the start of my ~/.zshrc configuration file in Arch Linux

# Environment variables
export MOZ_ENABLE_WAYLAND=1
export DOTFILES_DIR="$HOME/dotfiles"
export TERM="xterm-256color"
export PROMPT="%F{blue}%~%f %F{green}>%f "
export EDITOR="nvim"

# Shell
for file in $DOTFILES_DIR/scripts/shell/*; do
  if [ -f "$file" ]; then
    source "$file" || echo "Failed to source $file"
  fi
done

source $DOTFILES_DIR/scripts/deps.sh

# Compinit
compinit

# Zoxide
eval "$(zoxide init --cmd cd zsh)"
