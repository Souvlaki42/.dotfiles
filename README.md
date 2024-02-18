# Dotfiles
My configuration repository for Arch Linux based installations.

# Todo
[] Update installation docs to markdown as well.

# How to use
1. Install latest Arch Linux version using docs inside the installation folder.
2. Run:
```
git clone https://github.com/Souvlaki42/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow .
sudo pacman -S --needed --noconfirm - < "./installation/pacman_packages.txt"
cat "./installation/yay_packages.txt" | xargs yay -S --needed --noconfirm
sudo mkconfig -o /boot/grub/grub.cfg
xdg-user-dirs-update
timedatectl set-ntp true
timedatectl set-local-rtc 1 --adjust-system-clock
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
reboot
```
3. Do:
Open terminal and wait for all the first time scripts to do what they have to do, then restart terminal.
Do whatever else needed. Update this README.md accordingly.
