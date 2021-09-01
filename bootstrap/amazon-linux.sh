#!/bin/bash

# Use this script to create fresh bootstrapped image.

sudo yum update -y -q
sudo yum upgrade -y -q

# Install initial tools
sudo yum group install 'Development Tools' -y -q
sudo amazon-linux-extras install epel -y
sudo yum install vim-X11 golang docker tmux tree python3 git-lfs htop -y

# Configure initial tools
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker ec2-user
sudo newgrp docker

# Set upper limit to journalctl
journalctl --vacuum-time=180d

# Install dotfiles.
cd ~
git clone https://github.com/santosh/.dotfiles.git
cd .dotfiles
make install

cd ~
git clone https://github.com/santosh/.vim.git
cd .vim
make install

# Install bat
cd /tmp
LATEST_BAT_64_BIT=$(curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | \
    grep browser_download_url | grep 'x86_64' | grep musl | \
    cut -d '"' -f 4)
curl -sLO $LATEST_BAT_64_BIT
tar -xvf bat* && cd bat*
mkdir -p ~/bin && mv bat ~/bin
cd ~ && rm /tmp/bat*
