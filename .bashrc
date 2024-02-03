# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source all files in the completions folder
for file in ~/.config/completions/*; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# Prompt
#DEFAULT PS1='[\u@\h \W]\$ '

parse_git_branch() {
    local branch=$(git symbolic-ref --short HEAD 2> /dev/null)
    if [ -n "$branch" ]; then
        echo -e "(\033[31m$branch\033[0m)"
    fi
}
PS1='\[\033[01;34m\]\w\[\033[00m\]$(parse_git_branch) \[\033[01;32m\]>\[\033[00m\] '

# Tmux
if [ -x "$(command -v tmux)" ] && \
   [ -n "${DISPLAY}" ] && \
   [ -z "${TMUX}" ] && \
   [ "${TERM_PROGRAM}" != "vscode" ]; then
    exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi

# Aliases in general
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias vim="nvim"
alias cl="clear"
alias pacsync="sudo pacman -Qqe > ~/dotfiles/installation/installed_packages.txt && echo Pacman Synced!"
alias pac="sudo pacman -Syu && echo Pacman Updated!"
alias neo="neofetch"
alias pick="hyprpicker"
alias term="tmux kill-server"

# Aliases in git
alias gs="git status"
alias ga="git add -A"
alias gc="git commit -m"
alias gp="git push"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
