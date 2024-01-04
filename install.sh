!#/bin/bash
timedatectl set-local-rtc 1 --adjust-system-clock
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install curl -y
sudo apt-get install git -y
sudo apt-get install tmux -y
sudo snap install nvim --classic -y

