#/usr/bin/zsh

colors_file="$HOME/.cache/wal/colors.sh"
output_file="$HOME/.cache/wal/colors-hyprland.conf"

source "$colors_file"
source ~/.dotfiles.sh

WALLPAPERS_DIR="$DOTFILES_DIR/assets/wallpapers"
MONITOR_NAME=$(hyprctl monitors | grep Monitor | awk '{print $2}')

if [ -d "$WALLPAPERS_DIR" ]; then
  # Check if an argument is provided
  if [ -n "$1" ]; then
    NEW_WALLPAPER="$1"  # Use the provided argument
  else
    # Select a random wallpaper from the directory
    NEW_WALLPAPER=$(ls "$WALLPAPERS_DIR"/* | shuf -n 1)
  fi

  wal -i $NEW_WALLPAPER -s -t
  echo "\$wallpaper = $wallpaper" >> "$output_file"

  hyprctl hyprpaper unload all
  hyprctl hyprpaper preload $NEW_WALLPAPER
  hyprctl hyprpaper wallpaper "$MONITOR_NAME, $NEW_WALLPAPER"
fi
