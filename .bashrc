#neofetch
catnip
alias ls='ls --color=auto'
alias ls='ls --color=tty'
export LS_COLORS="ow=1;41;93:di=1;31"
#export QT_QPA_PLATFORM=wayland
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
PS1="\[\e[0;33m\]┌─[\[\e[1;31m\u\e[0;33m\]]──[\[\e[0;34m\]${HOSTNAME%%.*}\[\e[0;33m\]]\[\e[0;32m\]:\w$\[\e[0;33m\]\n\[\e[0;33m\]└──\[\e[0;33m\]╼\[\e[0m\]"
