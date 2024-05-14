# .dotfiles

This repository holds my configuration files dating back to the time I started using Linux and found that I can keep the configuration persistent over multiple systems or multiple installations.

## What I use

**For desktop computer**, there are 2 distros I'm using right now. One of my machine has an LTS version of Kubuntu 22.04. Another one is my experimental machine where I have Arch Linux installed. I'm trying Hyprland and ecosystem at the time of writing this.

**For server**, I prefer Debian. I have a raspberry pi. As well as any vm I spawn on any cloud is Debian.

## How to use

### Prerequisites

I believe that pre requisites are not worth mentioning here as they would keep changing. But it's worth mentioning that, if you encounter any command not found error, please install it. A few to name are: `fzf bat`

For a sneak peak to what packages I use, have a look in .config directory as well as .aliases file.

### Installation

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
What configuration do you use for your setup? Please let me know on twitter at [@sntshk](https://twitter.com/sntshk).
