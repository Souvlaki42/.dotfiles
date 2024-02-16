#!/usr/bin/zsh

function ipac() {
  local package="$1"
  sudo pacman --needed -Sy $package
  sudo pacman -Qqen > "$DOTFILES_DIR/installation/pacman_packages.txt"
  echo "Packages synced!"
}

function rpac() {
  local package="$1"
  sudo pacman -Runs $package
  sudo pacman -Qqen > "$DOTFILES_DIR/installation/pacman_packages.txt"
  echo "Packages synced!"
}

function iyay() {
  local package="$1"
  yay --needed -Sy $package
  yay -Qm > "$DOTFILES_DIR/installation/yay_packages.txt"
  echo "Packages synced!"
}

function ryay() {
  local package="$1"
  yay -Runs $package
  yay -Qm > "$DOTFILES_DIR/installation/yay_packages.txt"
  echo "Packages synced!"
}
