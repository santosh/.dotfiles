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

if [ -f ~/.dotfiles/common.sh ]; then
    . ~/.dotfiles/common.sh
fi

bindkey '^[[5~' history-beginning-search-backward
bindkey '^[[6~' history-beginning-search-forward

