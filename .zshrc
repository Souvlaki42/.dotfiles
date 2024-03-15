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
export KITTY_ENABLE_WAYLAND=1
export MOZ_ENABLE_WAYLAND=1
source $HOME/.dotfiles.sh
export EDITOR="nvim"
export TERM="xterm-256color"

precmd() { print -rP "%F{blue}%~%f$(git_branch)" }
export PROMPT="%F{green}❯%f "

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

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun & completions
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/home/souvlaki42/.bun/_bun" ] && source "/home/souvlaki42/.bun/_bun"

# Compinit
autoload -Uz compinit
compinit

# Zoxide
eval "$(zoxide init --cmd cd zsh)"
