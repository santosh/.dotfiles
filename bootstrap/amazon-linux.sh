#!/bin/bash

# Note: This script is intended to run in an interactive shell. 
# Use this script to create fresh bootstrapped image.

# Headings
# 1. Procedures
# 2. Installation

# Install latest golang
function installLatestGo() {
   curl -LO https://golang.org/dl/go1.17.3.linux-amd64.tar.gz
   sudo tar -C /usr/local/ -xzf go1.17.3.linux-amd64.tar.gz
   rm go1.17.3.linux-amd64.tar.gz
}

# Install and setup docker
function installDocker() {
    # Mounting the efs is the first thing you should do before starting the daemon in production environment.
    sudo yum install docker -y -q
    sudo echo '{ "data-root": "/efs/system/docker/data-root"  }' > /etc/docker/daemon.json

    if [ $(getent group docker) ]; then
        echo "docker group already exists; skipping."
    else
        sudo groupadd docker
    fi

    sudo usermod -aG docker ec2-user
    sudo newgrp docker

    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

    echo Done installing docker

    sudo systemctl start docker
    sudo systemctl enable docker
}

# Install latest bat
function installBat() {
    # Install bat
    cd /tmp
    LATEST_BAT_64_BIT=$(curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | \
        grep browser_download_url | grep 'x86_64' | grep musl | \
        cut -d '"' -f 4)
    curl -sLO $LATEST_BAT_64_BIT
    tar -xvf bat* && cd bat*
    mkdir -p ~/bin && mv bat ~/bin
    cd ~ && rm -r /tmp/bat*
    echo Done install bat.
}

{ set +x; } 2>/dev/null

sudo yum update -y -q
sudo yum upgrade -y -q

# Install initial tools
sudo yum group install 'Development Tools' -y -q
sudo amazon-linux-extras install epel -y -q
sudo yum install vim-X11 tmux tree python3 git-lfs htop -y -q
echo Done installing packages.

# invoke function (don't need paren)
installLatestGo
installDocker
installBat

# Set upper limit to journalctl
journalctl --vacuum-time=180d

# Install dotfiles.
cd ~
git clone https://github.com/santosh/.dotfiles.git
cd .dotfiles
make install
echo Done configuring dotfiles.

# Change SSH Port

echo -n "ENTER a random port number: "
read SSH_PORT
if [[ ! $SSH_PORT =~ ^[0-9]+$ ]] ; then
    echo "SSH port number must be an positive integer."
    exit
fi
sudo sed -i.bak "s/#Port 22/Port $SSH_PORT/g" /etc/ssh/sshd_config

echo Done bootstrapping.
