#!/usr/bin/zsh

function gs() # Git status or not a git repository.
{
  if [ -d .git ] || git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    git status
  else
    echo "Not a Git repository."
  fi
}

function havei() # Check if a package is installed in my system.
{
  package=$1
  if $(pacman -Qi $package &>/dev/null); then
    echo -e "\e[92m[ ✔️ ] $package is installed \e[39m"
  else
    echo -e "\e[91m[ ❌] $package is not installed \e[39m"
  fi
}

function picker() # Get color to clipboard.
{
  format=${1:-hex}
  hyprpicker --autocopy --format=$format
}

function t() # Handle TMUX connections.
{
    if [[ -n $TMUX ]]; then
        tmux kill-server
    else
        if tmux has-session -t "$USER" 2>/dev/null; then
            tmux attach-session -t "$USER"
        else
            tmux new-session -s "$USER"
        fi
    fi
}
