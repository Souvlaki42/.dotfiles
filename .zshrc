# This is the start of my ~/.zshrc configuration file in Arch Linux

# Compinit
autoload -U compinit 
compinit

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

# ENV
export PATH="$PATH:$HOME/go/bin:$HOME/.local/bin"
precmd() { print -rP "%F{blue}%~%f$(git_branch)" }
export PROMPT="%F{green}❯%f "
export KITTY_ENABLE_WAYLAND=1
export EDITOR="nvim"

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# NVM
source /usr/share/nvm/init-nvm.sh

# Zsh plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

# Keybindings
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Persistant History
HISTFILE=~/.zsh_history
HISTSIZE=1000000000000
SAVEHIST=1000000000000
setopt appendhistory

# Alias
alias dot="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias cl="clear"
alias ls="eza"
alias la="eza -a"
alias ll="eza -alh"
alias tree="eza --tree"
alias md="mkdir"
alias grep="grep --color auto"
alias cat="bat"
alias vim="nvim"
alias picker="hyprpicker"
alias nip="catnip"
alias top="htop"
alias gcl="git clone"
alias gpl="git pull"
alias grv="git remote -v"
alias ga="git add -A"
alias gu="git add -u"
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"
