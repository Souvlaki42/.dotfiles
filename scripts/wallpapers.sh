#/usr/bin/zsh

WALLPAPERS_DIR="$DOTFILES_DIR/assets/wallpapers"
MONITOR_NAME=$(hyprctl monitors | grep Monitor | awk '{print $2}')

if [ -d "$WALLPAPERS_DIR" ]; then
    RANDOM_BACKGROUND=$(ls $WALLPAPERS_DIR/* | shuf -n 1)
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload $RANDOM_BACKGROUND
    hyprctl hyprpaper wallpaper "$MONITOR_NAME, $RANDOM_BACKGROUND"
fi
