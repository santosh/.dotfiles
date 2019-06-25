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

export GOPATH=$HOME/.go
export PATH=$PATH:$HOME/.go/bin

export LD_PRELOAD=/usr/lib64/libstdc++.so.6:/lib64/libgcc_s.so.1

# You may also want to source the completion script (for bash):
# source /home/sntshk/rez-packages/completion/complete.sh
