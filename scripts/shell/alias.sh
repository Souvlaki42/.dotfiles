#!/usr/bin/zsh

# System
alias shell="source ~/.zshrc"
alias dot="$EDITOR $DOTFILES_DIR"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias cl="clear"

# Listings
alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -al"
alias grep="grep --color=auto"

# Apps
alias vim="$EDITOR"
alias neo="neofetch"
alias mat="cmatrix"
alias pick="hyprpicker"
alias tkill="tmux kill-server"

# Git
alias gc="git clone"
alias gpl="git pull"
alias gca="git commit -a -m"
alias gp="git push"
