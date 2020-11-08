#!/bin/bash

# LEGEND
# 0: Add repo and update
# 1.x: Installation
# 2.x: Removal
# 3.x: System level configurations


##### 0. Upadate and add additional package repositories #####
dnf update -y

# rpmfusion have packages which can't be made part of fedora because of licensing.
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# VSCode is my favorite. I do Python, Go, and sometimes JavaScript
rpm --import https://packages.microsoft.com/keys/microsoft.asc -y
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update -y
dnf install dnf-plugins-core -y





##### 1.0 Drivers #####
dnf install akmod-nvidia  # I have a Quadro K620 as of now.

##### 1.1 Programming stuffs #####
dnf groupinstall "Development Tools" -y
# vim-X11 because 'vim' package isn't compiled with X support (no global clipboard access)
dnf install vim-X11 code python3 python3-devel go docker -y

##### 1.2 Other utilities which comes in daily use #####
dnf install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -y
dnf install vlc  -y

##### 1.3 Some eye candy #####
dnf install fira-code-fonts zsh bat -y





##### 2.1 Bloat removal #####
dnf remove firefox kwalletmanager 'calligra-*' kontact kmail korganizer kaddressbook -y

##### 3.1 System level configurations #####
systemctl start docker
systemctl enable docker
usermod -aG docker sntshk
