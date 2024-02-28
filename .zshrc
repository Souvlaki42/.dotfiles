# This is the start of my ~/.zshrc configuration file in Arch Linux

function git_branch()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo " %F{red}("$branch")%f"
  fi
}

# Environment variables
# Flags
export KITTY_ENABLE_WAYLAND=1
export MOZ_ENABLE_WAYLAND=1
# Paths
export DOTFILES_DIR="$HOME/dotfiles"
# Prompt
precmd() { print -rP "%F{blue}%~%f$(git_branch)" }
export PROMPT="%F{green}❯%f "
# Apps
export EDITOR="nvim"

# Shell
for file in $DOTFILES_DIR/scripts/shell/*; do
  if [[ -f "$file" ]]; then
    source "$file" || echo "Failed to source $file"
  fi
done

# History search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# pnpm
case ":$PATH:" in
  # *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun & completions
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Compinit
compinit

# Zoxide
eval "$(zoxide init --cmd cd zsh)"
