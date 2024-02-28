#!/usr/bin/zsh

export PARU_HOME="$HOME/.local/share/paru"

if [ ! -d "$PARU_HOME" ]; then
  sudo pacman -S --needed base-devel
  git clone https://aur.archlinux.org/paru.git $PARU_HOME
  cd $PARU_HOME
  makepkg -si
fi

function packages() {
  if [[ -v DOTFILES_DIR ]]; then
    { paru -Qqen; paru -Qm; } > "$DOTFILES_DIR/assets/packages.txt"
    echo "Packages were synced successfully!"
  else
    echo "There is no package logs. Sorry!"
  fi
}

function updates() {
  sudo paru -Syu
  packages
}

function add() {
    local aur_packages=()
    local official_packages=()
    for package in "$@"; do
        if paru -Qi "$package" &>/dev/null; then
            official_packages+=("$package")
        else
            aur_packages+=("$package")
        fi
    done
    if [ ${#aur_packages[@]} -gt 0 ]; then
        paru -Sy --needed "${aur_packages[@]}"
    fi
    if [ ${#official_packages[@]} -gt 0 ]; then
        sudo paru -Sy --needed "${official_packages[@]}"
    fi
    packages
}

function remove() {
  sudo paru -Runs $@
  packages
}
