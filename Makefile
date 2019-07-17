# Kickstarter to everything.

clean:
	unlink ~/.zshrc
	unlink ~/.bashrc
	unlink ~/.aliases
	unlink ~/.gitconfig
	unlink ~/.tmux.conf
	unlink ~/.config/Code/User/settings.json

install:
	ln -sf ~/.dotfiles/.zshrc ~/.zshrc
	ln -sf ~/.dotfiles/.bashrc ~/.bashrc
	ln -sf ~/.dotfiles/.aliases ~/.aliases
	ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
	ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
	mkdir ~/.config/Code/User
	ln -sf ~/.dotfiles/.config/Code/User/settings.json ~/.config/Code/User/settings.json
	echo "Done installing dotfiles."

