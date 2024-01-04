#!/bin/bash

echo "Terminal Settings Manager"
echo "Base settings path?"
read raw_path
eval path="${raw_path:-"."}"

echo "What do you want to do?"
echo "1) Save Settings"
echo "2) Reset Settings"
echo "3) Load Settings"
read action

case $action in
        1)
                dconf dump /org/gnome/terminal/ > "$path/gnome_terminal_settings_backup.txt";;
        2)
                dconf reset -f /org/gnome/terminal/;;
        3)
                dconf load /org/gnome/terminal/ < "$path/gnome_terminal_settings_backup.txt";;
        *)
                echo "This option is not available. Try again later.";;
esac
