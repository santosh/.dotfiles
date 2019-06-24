# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
export PAGER=less

export VISUAL=vim
export EDITOR="$VISUAL"

# User specific aliases and functions
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Don't want for session to edit to append to history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# added by Anaconda3 installer
export PATH="$HOME/anaconda3/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH:$HOME/bin
export GOPATH=$HOME/.go

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

export LD_PRELOAD=/usr/lib64/libstdc++.so.6:/lib64/libgcc_s.so.1

# Change command prompt
source ~/.dotfiles/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"
