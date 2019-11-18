#!/bin/bash

# Maintainance Material
dnf update -y
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Programming stuffs
dnf groupinstall "Development Tools" -y
dnf install vim python3 python3-devel

rpm --import https://packages.microsoft.com/keys/microsoft.asc -y
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update -y
dnf install code -y

dnf copr enable evana/fira-code-fonts -y
dnf install fira-code-fonts -y

# Some eye candy
dnf install vlc zsh 

# There will also a user based setup which will setup things like prezto, vim
