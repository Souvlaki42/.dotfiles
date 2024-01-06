#!/bin/bash

# update
sudo apt-get update -y

# upgrade
sudo apt-get upgrade -y

# curl
sudo apt-get install curl -y

# git
sudo apt-get install git -y

# tmux
sudo apt-get install tmux -y

# tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# neovim
sudo snap install nvim --classic

# neofetch
sudo apt-get install neofetch -y

# python3
sudo apt-get install python3 -y

# python3 pip
sudo apt-get install python3-pip -y

# ripgrep
sudo apt-get install ripgrep -y

# wayland clipboard tool
sudo apt-get install wl-clipboard -y

# build essentials (c & cpp)
sudo apt-get install build-essential -y

# sharkdp's fd
sudo apt-get install fd-find -y

# dconf
# sudo apt-get install dconf -y

# nvm & node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install --lts

# pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -

# deno
curl -fsSL https://deno.land/install.sh | sh

# bun
curl -fsSL https://bun.sh/install | bash

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# go
curl -O https://go.dev/dl/go1.21.5.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz
sudo rm go1.21.5.linux-amd64.tar.gz

# github cli
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# terminal themes
curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.2.0/install.py | python3 -

