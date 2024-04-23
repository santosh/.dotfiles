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
	[ -f ~/.config/kitty ] && unlink ~/.config/kitty
	[ -f ~/.config/mpv ] && unlink ~/.config/mpv
	[ -f ~/.config/ranger ] && unlink ~/.config/ranger
	[ -f ~/.config/bat ] && unlink ~/.config/bat

install:
	ln -sf ~/.dotfiles/.zshrc ~/.zshrc
	ln -sf ~/.dotfiles/.bashrc ~/.bashrc
	ln -sf ~/.dotfiles/.aliases ~/.aliases
	ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
	ln -sf ~/.dotfiles/.inputrc ~/.inputrc
	ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
	mkdir -p ~/.config
	ln -sf ~/.dotfiles/.config/hypr ~/.config/hypr
	ln -sf ~/.dotfiles/.config/rofi ~/.config/rofi
	ln -sf ~/.dotfiles/.config/waybar ~/.config/waybar
	ln -sf ~/.dotfiles/.config/nvim ~/.config/nvim
	ln -sf ~/.dotfiles/.config/bat ~/.config/bat
	ln -sf ~/.dotfiles/.config/kitty ~/.config/kitty
	ln -sf ~/.dotfiles/.config/mpv ~/.config/mpv
	ln -sf ~/.dotfiles/.config/ranger ~/.config/ranger

	echo "Done installing dotfiles."

bootstrap_fedora:
	sudo bash bootstrap/fedora.sh
