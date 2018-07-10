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

export EDITOR=vi

bindkey '^[[5~' history-beginning-search-backward
bindkey '^[[6~' history-beginning-search-forward
