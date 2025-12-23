eval "$(/opt/homebrew/bin/brew shellenv)"
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
setopt hist_ignore_dups

zstyle :compinstall filename '$HOME/.zshrc'

unsetopt beep
bindkey -e

autoload -Uz compinit
compinit

if [ -d "$HOME/.env.d" ]; then
  for i in "$HOME/.env.d/"*.sh; do
    if [ -r "$i" ]; then
      . "$i"
      export ZSH_SCRIPTS=${ZSH_SCRIPTS}:${i##*/}
    fi
  done
  unset i
fi
