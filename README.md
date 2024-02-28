# Dotfiles
My configuration repository for Arch Linux based installations.

## Todo
- [x] Update installation docs to markdown in README.
- [x] Fix terminal and Neovim colors.
- [ ] Add screenshots to README.
- [ ] Make sure that copy images are stored in rofi clipboard manager.
- [ ] Add randomly generated hyprpaper wallpapers. (?)
- [ ] Make and use the dots manager.

## How to use
1. Connect to internet.
Ethernet should work automatically.
For WiFi, run these:
```bash
# First, open the WiFi connection utility tool:
iwctl
# If you do not know your wireless device name, list all Wi-Fi devices:
device list
# Then, to initiate a scan for networks (note that this command will not output anything):
station <device> scan
# You can then list all available networks:
station <device> get-networks
# Finally, to connect to a network:
station <device> connect <SSID>
# You may get prompted to type the network's passphrase
# To make sure that the connection was initialized correctly:
station <device> show
# Quit the tool and move to the next step.
# For more documentation related to WiFi: https://wiki.archlinux.org/title/iwd.
```
2. Partition your drive.
You can choose automatic, but this is how to do it manually:
```bash
# First, list disks:
fdisk -l
# Then, open partition manager tool to the disk you plan to install Arch Linux to:
cfdisk /dev/<disk_name>
# You need to manually create:
# - An 1G EFI system partition out of free space.
# - A <ram_size>G Linux swap partition out of free space (optional).
# - A Linux filysystem partition with the remaining free space.
# Write the changes you just did and exit the partitioning tool.
# Next, format the partitions you just created:
mkfs.fat -F32 /dev/<efi_partition> # Format efi_partition as fat32.
mkfs.ext4 /dev/<filysystem_partition> # Format filysystem partition as ext4. 
mkswap /dev/<swap_partition> # Register the swap_partition.
swapon /dev/<swap_partition> # Enable the swap_partition.
# Finally, mount the efi and filysystem partitions:
mount /dev/<filysystem_partition> /mnt # Mount filysystem_partition to /mnt.
mount /dev/<efi_partition> /mnt/boot # Mount efi_partition to /mnt/boot.
```
3. Run the archinstall script:
```bash
# Using my pre-defined configuration file
archinstall --config https://raw.githubusercontent.com/Souvlaki42/dotfiles/main/user_configuration.json
# Manual configuration
archinstall
# DON'T FORGET, to set up a user account.
# OPTIONALY, you can set up a root password as well.
# OPTIONALY, you can make any other changes you want. (If you change anything else, please save new user configuration to /mnt/root or somewhere else)
# When you are done configuring, press install, wait to be done, say no to chroot, reboot and move to the next and final step.
```
4. Configure the system to your liking.
This including installing all dotfiles from the GitHub repo, fixing anything broken and making any other changes you want later while making sure README.md remains up to date. Have fun!
```bash
git clone https://github.com/Souvlaki42/dotfiles.git ~/dotfiles
~/dotfiles/setup.sh
```
## Optional stuff for later
### Custom GRUB theme
(Your videoinfo resolution probably is 1920x1080)\
Follow <https://www.youtube.com/watch?v=Y-TQJYJ8g-U>\
Use <https://www.gnome-look.org/p/1307852/> (Tela)
### Custom display manager
Follow <https://www.youtube.com/watch?v=CpwJuHhUxEY> (Ly)
