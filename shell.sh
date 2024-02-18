#!/usr/bin/zsh

# Shell
for file in $DOTFILES_DIR/scripts/shell/*; do
  if [ -f "$file" ]; then
    source "$file" || echo "Failed to source $file"
  fi
done

# pnpm
case ":$PATH:" in
  # *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun & completions
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/home/souvlaki42/.bun/_bun" ] && source "/home/souvlaki42/.bun/_bun"

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Compinit
compinit

# Zoxide
eval "$(zoxide init --cmd cd zsh)"
