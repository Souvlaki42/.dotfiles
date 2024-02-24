#!/usr/bin/zsh

export PARU_HOME="$HOME/.local/share/paru"

if [ ! -d "$PARU_HOME" ]; then
  sudo pacman -S --needed base-devel
  git clone https://aur.archlinux.org/paru.git $PARU_HOME
  cd $PARU_HOME
  makepkg -si
fi

function remember() {
  if [[ -v DOTFILES_DIR ]]; then
    { paru -Qqen; paru -Qm; } > "$DOTFILES_DIR/packages.txt"
    echo "Packages were synced successfully!"
  else
    echo "There is no package logs. Sorry!"
  fi
}

function news() {
  sudo paru -Syu
  remember
}

function yay() {
  sudo paru --needed -Sy $@
  remember
}

function yeet() {
  sudo paru -Runs $@
  remember
}
