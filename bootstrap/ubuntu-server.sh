#!/bin/bash

##### 0. Update #####

apt update
apt -y upgrade


##### 1. Installation #####
apt install make

##### 1.1 Developer Tools #####

function installDocker() {
    apt install ca-certificates curl gnupg lsb-release

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    apt update
    apt install docker-ce docker-ce-cli containerd.io -y

    grep -q -E "^docker:" /etc/group || groupadd docker
    usermod -aG docker ubuntu
}

installDocker
apt install nfs-common build-essential bat

# Set upper limit to journalctl
journalctl --vacuum-time=180d

echo -n "ENTER a random port number: "
read SSH_PORT
if [[ ! $SSH_PORT =~ ^[0-9]+$  ]] ; then
    echo "SSH port number must be an positive integer."
    exit
fi
sed -i.bak "s/#Port 22/Port $SSH_PORT/g" /etc/ssh/sshd_config

apt autoremove
