# This is the start of my ~/.zshrc configuration file in Arch Linux

# Environment variables
export DOTFILES_DIR="$HOME/dotfiles"
export TERM="xterm-256color"
export PROMPT="%F{blue}%~%f %F{green}>%f "
export EDITOR="nvim"

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Shell
for file in $DOTFILES_DIR/scripts/shell/*; do
  if [ -f "$file" ]; then
    source "$file" || echo "Failed to source $file"
  fi
done

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/souvlaki42/.local/share/pnpm"
case ":$PATH:" in
  # *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/home/souvlaki42/.bun/_bun" ] && source "/home/souvlaki42/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
