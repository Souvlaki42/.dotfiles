#!/usr/bin/zsh

function gs() {
  if [ -d .git ] || git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    git status
  else
    echo "Not a Git repository."
  fi
}

function rmd() {
    local target="$1"

    # If no argument is provided, use the current directory
    [ -z "$target" ] && target="."

    rm -rf "$target"/{*,.[!.]*,..?*}
}

function havei() {
  package=$1
  if $(pacman -Qi $package &>/dev/null); then
    echo -e "\e[92m[ ✔️ ] $package is installed \e[39m"
  else
    echo -e "\e[91m[ ❌] $package is not installed \e[39m"
  fi
}
