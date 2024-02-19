# Dotfiles
My configuration repository for Arch Linux based installations.

## Todo
- [ ] Update installation docs to markdown as well.
- [ ] Fix terminal and Neovim colors.
- [ ] Add randomly generated hyprpaper wallpapers. (?)

## How to use
1. Install latest Arch Linux version using docs inside the installation folder.
2. Run:
```bash
chsh
git clone https://github.com/Souvlaki42/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow .
sudo foundit # whatever the foundit function does. 
sudo mkconfig -o /boot/grub/grub.cfg
xdg-user-dirs-update
timedatectl set-ntp true
timedatectl set-local-rtc 1 --adjust-system-clock
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
reboot
```
Then just:
Open terminal. Wait for all the first time scripts to do what they have to do.\
Then restart terminal. Do whatever else needed. Update this README.md accordingly.

## Custom GRUB theme
(Your videoinfo resolution propably is 1920x1080)\
Follow <https://www.youtube.com/watch?v=Y-TQJYJ8g-U>.\
Use <https://www.gnome-look.org/p/1307852/>.
