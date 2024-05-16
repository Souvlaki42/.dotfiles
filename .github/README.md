# Dotfiles
My configuration repository for Arch Linux based installations.

![I use Arch BTW](https://raw.githubusercontent.com/Souvlaki42/dotfiles/main/.local/assets/arch.jpg)

## Uses
OS -> Arch Linux
Window Manager -> Hyprland
Display Manager -> SDDM (Theme: Chili)
Theme -> Catppuccin Mocha
Fetch -> Catnip
Cursor -> Bibata Modern Ice
Font -> JetBrains Mono Nerd Font
Terminal -> Kitty
Filemanager -> Thunar
Browser -> Firefox
Menu -> Wofi
Bar -> Waybar
Logout -> Wlogout
Chat -> WebCord
Music -> Spotify
Editor -> VS Code
Notes -> Dynalist
Game Engine -> Godot
Screenshot Engine -> Grim

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
# Delete any previous partitions you don't need now.
# You need to manually create:
# - An 1G EFI system partition out of free space.
# - A <ram_size>G Linux swap partition out of free space (optional).
# - A Linux filesystem partition with the remaining free space.
# Write the changes you just did and exit the partitioning tool.
# Next, format the partitions you just created:
mkfs.fat -F32 /dev/<efi_partition> # Format efi_partition as fat32.
mkfs.(ext4 or btrfs) /dev/<filesystem_partition> # Format filesystem_partition as ext4 or btrfs. 
mkswap /dev/<swap_partition> # Register the swap_partition.
swapon /dev/<swap_partition> # Enable the swap_partition.
# Finally, mount the efi and filesystem partitions (and optionally the windows one):
mount /dev/<filesystem_partition> /mnt # Mount filesystem_partition to /mnt.
mount /dev/<efi_partition> /mnt/boot # Mount efi_partition to /mnt/boot.
mount /dev/<windows_partition> /mnt/windows # Mount windows_partition to /mnt/windows.
```
3. Run the archinstall script:
```bash
# Using my pre-defined configuration file
archinstall --config https://raw.githubusercontent.com/Souvlaki42/dotfiles/main/.local/assets/user_configuration.json
# Manual configuration
archinstall
# DON'T FORGET, to set up a user account.
# OPTIONALY, you can set up a root password as well.
# OPTIONALY, you can make any other changes you want. (If you change anything else, please save new user configuration to /mnt/root or somewhere else)
# When you are done configuring, press install, wait to be done, say no to chroot, reboot and move to the next and final step.
```
4. Configure and customize the system to your liking.
```bash
git clone --bare https://github.com/Souvlaki42/dotfiles.git $HOME/dotfiles # Can be any other directory you like.
git --git-dir=$HOME/dotfiles --work-tree=$HOME checkout
```

## Screenshots
![Browser](https://raw.githubusercontent.com/Souvlaki42/dotfiles/main/.local/assets/browser.png)
![Terminal](https://raw.githubusercontent.com/Souvlaki42/dotfiles/main/.local/assets/terminal.png)
![Files](https://raw.githubusercontent.com/Souvlaki42/dotfiles/main/.local/assets/files.png)
![Desktop](https://raw.githubusercontent.com/Souvlaki42/dotfiles/main/.local/assets/desktop.png)
