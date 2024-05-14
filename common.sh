# Hold common config between all the shells I use.
# Currently bash and zsh

export PAGER=less

export VISUAL=nvim
export EDITOR="$VISUAL"

# For user level installation
PATH=$HOME/.local/bin:$PATH

# For system level installtation by privileged user
PATH=$PATH:/usr/local/go/bin

# Check if go is installed, then set go related vars
if [ -x "$(command -v go)" ]; then
	# If host system is Amazon Linux, GOPATH should go in /efs
	if uname -r | grep -q 'amzn'; then
		export GOPATH=/efs/system/go
	else
		export GOPATH=$(go env GOPATH)
	fi

	export GOBIN=$GOPATH/bin
	PATH=$PATH:$GOBIN
fi

export PATH=$PATH:/var/lib/snapd/snap/bin

# On debian based systems, this value of LD_PRELOAD shows errors
if [ -x "$(grep -q rhel /etc/os-release)" ]; then
	export LD_PRELOAD=/usr/lib64/libstdc++.so.6:/lib64/libgcc_s.so.1
fi

# As we are inside tmux, let terminal support 256 colors,
# so vim can show colorschemes properly inside tmux
if [[ $TERM == screen ]]; then TERM=screen-256color; fi

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# If using user level ranger config, avoid reloading the system one
export RANGER_LOAD_DEFAULT_RC=FALSE
