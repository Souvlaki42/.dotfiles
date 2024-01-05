#!/bin/bash

timedatectl set-local-rtc 1 --adjust-system-clock

echo "Github authentication token?"
read token

source ./install.sh

echo $token | gh auth login --with-token
