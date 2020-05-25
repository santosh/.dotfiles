# dotfiles

Create symlink to homedir. Leave the folder as .dotfiles. GitLab at the moment doesn't allow dot (.) at start of project name.

## Before and After Drill

If you are reinstalling a fresh version of Fedora from scratch.

- [ ] Commit this repo.
- [ ] Take note of extra folders inside home directory
- [ ] Backup files in /home/ to unaffected partition.
- [ ] backup gpg and ssh keys

Do this after the installation.

- [ ] Restore files to /home/
- [ ] restore gpg and ssh keys

## Generic Software Installation

Bootstrap will do the following steps, chronologically. Bootstrap needs to be run as root.

- `dnf update`
- Group install **Developer Tools**
- zsh
- Intall Docker
- VSCode
- Install Fira Code
- Chrome

Bootstrap removes following from base installation of Fedora to lower bandwidth when updating system.

- Firefox

*Makefile* does following actions. Those are kept separate from bootstrap because they work in userspace.

- Configure zsh with presto

These software are not common and I have left them to install manually on first need due to installation complexity and/or high bandwidth needs.

- Zoom
- GIMP *(`sudo dnf install gimp`)*
- Teamviewer
- Skype
- VirtualBox

## Additional manual settings

There have potencial to be automated.

- If KDE, https://www.youtube.com/watch?v=Ncd7Sg9mbAY&t=166s
- Configure Fira Code in Konsole.
- `usermod -aG docker your-user` to use docker without sudo.
