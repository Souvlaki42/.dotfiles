# Dotfiles
My configuration repository for Arch Linux based installations.

![I use Arch BTW](https://raw.githubusercontent.com/Souvlaki42/dotfiles/main/.local/assets/arch.jpg)

This now includes a lot of stuff I don't use anymore, but I'm keeping it here for future reference.

Also, it includes stuff for my WSL2 installations with WezTerm and Neovim.

## Uses
OS -> Arch Linux/WSL2 \
Window Manager -> Hyprland \
Display Manager -> SDDM (Theme: Chili) \
Theme -> Catppuccin Mocha \
Dotfiles Manager -> GNU Stow \
Fetch -> Fastfetch \
Prompt -> Oh My Posh (RIP p10k) \
Cursor -> Bibata Modern Ice \
Font -> Hack Nerd Font \
Terminal -> WezTerm \
Filemanager -> Thunar \
Browser -> Zen Browser \
Launcher -> Wofi \
Bar -> HyprPanel \
Logout -> Wlogout \
Chat -> WebCord \
Music -> Spotify \
Editor -> VS Code/Neovim/Zed \
Notes -> Obsidian \
Game Engine -> Godot/Mono \
Screenshot Engine -> Hyprshot

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
git clone https://github.com/Souvlaki42/dotfiles.git $HOME/dotfiles # Can be any other directory you like.
cd $HOME/dotfiles # Or any other directory you chose to use.
stow . # Create the required symlinks using GNU Stow so the system functions like you want to.
reboot # (or sudo reboot) This is optional but recommended to make sure the changes are applied before using the system.
```

## Screenshots
![Browser](https://raw.githubusercontent.com/Souvlaki42/dotfiles/main/.local/assets/browser.png)
![Terminal](https://raw.githubusercontent.com/Souvlaki42/dotfiles/main/.local/assets/terminal.png)
![Files](https://raw.githubusercontent.com/Souvlaki42/dotfiles/main/.local/assets/files.png)
![Desktop](https://raw.githubusercontent.com/Souvlaki42/dotfiles/main/.local/assets/desktop.png)
![Launcher](https://raw.githubusercontent.com/Souvlaki42/dotfiles/main/.local/assets/launcher.png)
