# Kickstarter to everything.

nothing:
	@echo Dry run.

clean:
	[ -f ~/.zshrc ] && unlink ~/.zshrc
	[ -f ~/.bashrc ] && unlink ~/.bashrc
	[ -f ~/.aliases ] && unlink ~/.aliases
	[ -f ~/.gitconfig ] && unlink ~/.gitconfig
	[ -f ~/.inputrc ] && unlink ~/.inputrc
	[ -f ~/.tmux.conf ] && unlink ~/.tmux.conf
	[ -f ~/.config/nvim ] && unlink ~/.config/nvim
	[ -f ~/.config/hypr ] && unlink ~/.config/hypr
	[ -f ~/.config/rofi ] && unlink ~/.config/rofi
	[ -f ~/.config/waybar ] && unlink ~/.config/waybar

install:
	ln -sf ~/.dotfiles/.zshrc ~/.zshrc
	ln -sf ~/.dotfiles/.bashrc ~/.bashrc
	ln -sf ~/.dotfiles/.aliases ~/.aliases
	ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
	ln -sf ~/.dotfiles/.inputrc ~/.inputrc
	ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
	ln -sf ~/.dotfiles/.config/hypr ~/.config/hypr
	ln -sf ~/.dotfiles/.config/rofi ~/.config/rofi
	ln -sf ~/.dotfiles/.config/waybar ~/.config/waybar
	git clone https://github.com/santosh/nvim.git ~/.config/nvim

	echo "Done installing dotfiles."

bootstrap_fedora:
	sudo bash bootstrap/fedora.sh
