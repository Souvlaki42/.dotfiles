# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/ilias/.zsh/completions:"* ]]; then export FPATH="/home/ilias/.zsh/completions:$FPATH"; fi

# Export editors
export EDITOR="nvim"
export VISUAL="code"

# Nix
export NIXPKGS_ALLOW_UNFREE=1

# Export browser in WSL2
export BROWSER=wslview

# Configure PATH
export GOPATH=$HOME/go
export PHP_INI_SCAN_DIR="/home/ilias/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export PATH=$HOME/.nix-profile/bin:$HOME/.local/bin:$GOPATH/bin:$HOME/.cargo/bin:$HOME/.npm-global:~/.config/herd-lite/bin:$PATH

# True colors (16 million colors support)
export COLORTERM=truecolor

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light MichaelAquilina/zsh-you-should-use
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Aliases
alias cl="clear; tmux clear-history; clear"
alias ls="eza"
alias la="eza -a"
alias ll="eza -alh"
alias tree="eza --tree"
alias md="mkdir"
alias cat="bat"
alias v="nvim"
alias top="htop"
alias fetch="fastfetch"

# Shell integration
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(direnv hook zsh)"

# Oh My Posh configuration
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Automatically start or attach to a tmux session
if command -v tmux > /dev/null && [ -z "$TMUX" ]; then
  # Check if there's any existing session
  if tmux ls &>/dev/null; then
    # Attach to the last active session
    tmux attach-session -t "$(tmux ls | grep -o '^[^:]*' | head -n 1)"
  else
    # Start a new session if no sessions exist
    tmux new-session
  fi
fi

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward
bindkey "^[w" kill-region

# Setup home/end keys in zsh
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Use modern completion system
fpath+=~/.zfunc
autoload -Uz compinit
compinit

# Zinit setup
zinit cdreplay -q

# Zstyles
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# bun
[ -s "/home/ilias/.bun/_bun" ] && source "/home/ilias/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# deno
. "/home/ilias/.deno/env"
