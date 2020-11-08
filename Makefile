# Kickstarter to everything.

clean:
	[ -f ~/.zshrc ] && unlink ~/.zshrc
	[ -f ~/.bashrc ] && unlink ~/.bashrc
	[ -f ~/.aliases ] && unlink ~/.aliases
	[ -f ~/.gitconfig ] && unlink ~/.gitconfig
	[ -f ~/.tmux.conf ] && unlink ~/.tmux.conf

install:
	ln -sf ~/.dotfiles/.zshrc ~/.zshrc
	ln -sf ~/.dotfiles/.bashrc ~/.bashrc
	ln -sf ~/.dotfiles/.aliases ~/.aliases
	ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
	ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
	echo "Done installing dotfiles."

