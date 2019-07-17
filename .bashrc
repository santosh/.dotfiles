# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# User specific aliases and functions
if [ -f ~/.dotfiles/common.sh ]; then
    . ~/.dotfiles/common.sh
fi

# Don't want for session to edit to append to history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# colors!
red="\[\033[0;31m\]"
green="\[\033[0;32m\]"
yellow="\[\033[0;33m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
cyan="\[\033[0;36m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/.dotfiles/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$purple\u$reset at $purple\h$reset in $blue\W$green\$(__git_ps1) $ $reset"
