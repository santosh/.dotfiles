# .dotfiles

This repository holds my configuration files dating back to the time I started using Linux and found that I can keep the configuration persistent over multiple systems or multiple installations.

## What I use

### For desktop computer

The distro of my choice is [Fedora with KDE](https://spins.fedoraproject.org/kde/)
being the desktop environment of choice. Some notable application I use is:

- Docker
- ZSH
- VS Code
- FiraCode
- Google Chrome
- VLC
- ...

A full list can be found inside [./bootstrap/fedora.sh](./bootstrap/fedora.sh) file.
The bootstrap also removes some clutter along with installing packages.

#### How to use

1. Clone this repo to ~/.dotfiles:

```
git clone https://github.com/santosh/.dotfiles ~/.dotfiles
```

2. `cd` into the directory and run the following command and wait until
   installation.

```
cd ~/.dotfiles
make install
```

If you want to additionally install packages, run the bootstrap scrit.

```
make bootstrap_fedora
```

#### Before and After Drill

If you are reinstalling a fresh version of Fedora from scratch.

- [ ] Commit this repo. Push to the remote.
- [ ] Take note of extra folders inside the home directory.
- [ ] Backup files in `/home/` to unaffected partition.

After the reinstall, restore `/home/`.

### For cloud computer

Packages I typically install on a computer are:

- Git
- Vim
- Go
- tmux
- tree
- python3
- git-lfs
- htop
- docker
- bat

A bootstrap script can be found in [./bootstrap/amaozon-linux.sh](./bootstrap/amaozon-linux.sh). One way to use this bootstrap is to run the script on a fresh instance and create a custom AMI out of it.

What cofiguration do you use for your setup? Please let me know on twitter at [@sntshk](https://twitter.com/sntshk).
