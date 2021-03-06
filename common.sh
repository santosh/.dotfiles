# Hold common config between all the shells I use. 
# Currently bash and zsh

export PAGER=less

export VISUAL=vim
export EDITOR="$VISUAL"

export PATH=$HOME/.local/bin:$PATH:$HOME/bin

# Only if you install your rez at $HOME/rez
export PATH=$HOME/rez/bin/rez:$PATH

# added by Anaconda3 installer
export PATH="$HOME/anaconda3/bin:$PATH"

export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin
export GOSRC=$GOPATH/src
export PATH=$PATH:$GOBIN
export PATH=$PATH:/var/lib/snapd/snap/bin

# colon separated list of path, for every subdir in any of the path listed below
# you don't need to mention full path.
export CDPATH=$GOSRC

export LD_PRELOAD=/usr/lib64/libstdc++.so.6:/lib64/libgcc_s.so.1

# As we are inside tmux, let terminal support 256 colors,
# so vim can show colorschemes properly inside tmux
if [[ $TERM == screen  ]]; then TERM=screen-256color; fi

# You may also want to source the completion script (for bash):
# source /home/sntshk/rez-packages/completion/complete.sh
