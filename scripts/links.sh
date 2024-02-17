#!/usr/bin/zsh

if [[ ! -L "/etc/sddm.conf.d/sddm.conf" ]]; then
  sudo ln -s "$DOTFILES_DIR/system/sddm/sddm.conf" "/etc/sddm.conf.d/sddm.conf"
fi

if [[ ! -L "/usr/share/sddm/themes/catppuccin-mocha/" ]]; then
  sudo ln -s "$DOTFILES_DIR/system/sddm/catppuccin-mocha/" "/usr/share/sddm/themes"
fi
