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
export EDITOR="nvim"

# Zsh prompt
precmd() { print -rP "%F{blue}%~%f$(git_branch)" }
export PROMPT="%F{green}❯%f "

# fzf catppuccin mocha
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Shell
source $HOME/.dotfiles.sh
for file in $DOTFILES_DIR/scripts/*; do
  if [[ -f "$file" ]] && [[ "$file" =~ "shell_" ]]; then
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
export PNPM_HOME="/home/souvlaki42/.local/share/pnpm"
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
autoload -Uz promptinit
promptinit

# Zoxide
eval "$(zoxide init --cmd cd zsh)"
