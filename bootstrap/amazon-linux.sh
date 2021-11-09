#!/bin/bash

# Note: This script is intended to run in an interactive shell. 
# Use this script as root to create fresh bootstrapped image.

# Headings
# 1. Procedures
# 2. Installation

# Install latest golang
function installLatestGo() {
   curl -LO https://golang.org/dl/go1.17.3.linux-amd64.tar.gz
    tar -C /usr/local/ -xzf go1.17.3.linux-amd64.tar.gz
   rm go1.17.3.linux-amd64.tar.gz
}

# Install and setup docker
function installDocker() {
    # Mounting the efs is the first thing you should do before starting the daemon in production environment.
    yum install docker -y -q
    echo '{ "data-root": "/efs/system/docker/data-root"  }' > /etc/docker/daemon.json

    grep -q -E "^docker:" /etc/group || groupadd docker

    usermod -aG docker ec2-user

    curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose

    echo Done installing docker. Starting up the service

    systemctl start docker
    systemctl enable docker

    echo Done starting docker service.
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

yum update -y -q
yum upgrade -y -q

# Install initial tools
yum group install 'Development Tools' -y -q
amazon-linux-extras install epel -y -q
yum install vim-X11 tmux tree python3 git-lfs htop -y -q
echo Done installing packages.

# invoke function (don't need paren)
installLatestGo
installDocker
installBat

# Set upper limit to journalctl
journalctl --vacuum-time=180d

# Change SSH Port

echo -n "ENTER a random port number: "
read SSH_PORT
if [[ ! $SSH_PORT =~ ^[0-9]+$ ]] ; then
    echo "SSH port number must be an positive integer."
    exit
fi
sed -i.bak "s/#Port 22/Port $SSH_PORT/g" /etc/ssh/sshd_config

echo "Done bootstrapping. Go ahead and 'make install' the .dotfiles"

# Install dotfiles.
git clone https://github.com/santosh/.dotfiles.git /home/ec2-user/.dotfiles

