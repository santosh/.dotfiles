# .dotfiles

This repository holds my configuration files dating back to the time I started using Linux and found that I can keep the configuration persistent over multiple systems or multiple installations.

## What I use

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

## How to use

1. Clone this repo to ~/.dotfiles:

```
git clone https://github.com/santosh/.dotfiles ~/.dotfiles
```

2. `cd` into the directory and run the following command and wait until 
installation.

```
make install
make bootstrap_fedora
```
This should set up most of the stuff. If not, please open an issue.

## Before and After Drill

If you are reinstalling a fresh version of Fedora from scratch.

- [ ] Commit this repo. Push to the remote.
- [ ] Take note of extra folders inside the home directory.
- [ ] Backup files in `/home/` to unaffected partition.

After the reinstall, restore `/home/`.

## TODO

- [ ] Extend the bootstrap to include [.vim](https://github.com/santosh/.vim).
