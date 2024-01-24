# ~/.bashrc

# If not running interactively, don't do anything
if [[ $- != *i* ]]; then
    return
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#DEFAULT PS1='[\u@\h \W]\$ '

# Prompt
if [ -f /usr/share/git/completion/git-completion.bash ]; then
    source /usr/share/git/completion/git-completion.bash
fi

if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
fi

if command -v __git_ps1 &>/dev/null; then
    PS1='\[\e[92;1m\]\u\[\e[0m\]:\[\033[01;34m\]\w\[\e[0m\]$(__git_ps1 " (\[\033[01;31m\]%s\[\e[0m\])")\$ '
else
    PS1='\[\e[92;1m\]\u\[\e[0m\]:\[\033[01;34m\]\w\[\e[0m\]\$ '
fi

# Pass Completion
if [ -f $HOME/my/dotfiles/pass.bash-completion ]; then
	source $HOME/my/dotfiles/pass.bash-completion
fi

# Aliases
alias vim="nvim"
alias lh="ls -d .[^.]*"
alias gs="git status"
