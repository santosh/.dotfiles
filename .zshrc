#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
autoload -Uz promptinit
promptinit
prompt steeef

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

export EDITOR=vim

export PATH=$HOME/.local/bin:$PATH:$HOME/bin:$HOME/.go/bin
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export GOPATH=$HOME/.go

export PYTHONSTARTUP=$HOME/.dotfiles/python-startup.py

# Hook a go executable after creating

bindkey '^[[5~' history-beginning-search-backward
bindkey '^[[6~' history-beginning-search-forward
