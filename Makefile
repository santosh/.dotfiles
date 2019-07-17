# Kickstarter to everything.

clean:
	[ -f ~/.zshrc ] && unlink ~/.zshrc
	[ -f ~/.bashrc ] && unlink ~/.bashrc
	[ -f ~/.aliases ] && unlink ~/.aliases
	[ -f ~/.gitconfig ] && unlink ~/.gitconfig
	[ -f ~/.tmux.conf ] && unlink ~/.tmux.conf
	[ -f ~/.config/Code/User/settings.json ] && unlink ~/.config/Code/User/settings.json

install:
	ln -sf ~/.dotfiles/.zshrc ~/.zshrc
	ln -sf ~/.dotfiles/.bashrc ~/.bashrc
	ln -sf ~/.dotfiles/.aliases ~/.aliases
	ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
	ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
	mkdir ~/.config/Code/User
	ln -sf ~/.dotfiles/.config/Code/User/settings.json ~/.config/Code/User/settings.json
	echo "Done installing dotfiles."

