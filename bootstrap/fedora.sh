#!/bin/bash

# 0. Prepare for war.


dnf update -y

# rpmfusion have packages which can't be made part of fedora because of licensing.
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

dnf install dnf-plugins-core -y

# Drivers
dnf install akmod-nvidia


# 1. Programming stuffs


dnf groupinstall "Development Tools" -y
dnf install vim python3 python3-devel
# hub is superset of git command and add makes working on github easy
# from command line; see https://hub.github.com/
dnf install hub -y

# Install Docker
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
dnf install docker-ce docker-ce-cli containerd.io -y
grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
systemctl start docker

# VSCode is my favorite. I do Python, Go, and sometimes JavaScript
rpm --import https://packages.microsoft.com/keys/microsoft.asc -y
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update -y
dnf install code -y




# 2. Eye candy stuff
dnf copr enable evana/fira-code-fonts -y
dnf install fira-code-fonts -y

# Install Google Chrome
dnf install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -y

# Some eye candy
dnf install vlc zsh 





# UNINSTALL

dnf remove firefox
