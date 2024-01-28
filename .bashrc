# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Default Settings
alias ls='ls --color=auto'
alias grep='grep --color=auto'
#DEFAULT PS1='[\u@\h \W]\$ '

# Source all files in the my_scripts folder
for file in ~/.config/completions/*; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# Prompt
if command -v __git_ps1 &>/dev/null; then
    PS1='\[\e[92;1m\]\u\[\e[0m\]:\[\033[01;34m\]\w\[\e[0m\]$(__git_ps1 " (\[\033[01;31m\]%s\[\e[0m\])")\$ '
else
    PS1='\[\e[92;1m\]\u\[\e[0m\]:\[\033[01;34m\]\w\[\e[0m\]\$ '
fi

# Tmux
if [ -x "$(command -v tmux)" ] && \
   [ -n "${DISPLAY}" ] && \
   [ -z "${TMUX}" ] && \
   [ "${TERM_PROGRAM}" != "vscode" ]; then
    exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi

# Aliases
alias vim="nvim"
alias lh="ls -d .[^.]*"
alias gs="git status"
alias cl="clear"
alias geninstall="pacman -Qqe > ~/dotfiles/installation/installed_packages.txt"
alias neo="neofetch"
