eval "$(/opt/homebrew/bin/brew shellenv)"

# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# source all .sh file in .env.d
if [ -d "$HOME"/.env.d ]; then
  for i in "$HOME"/.env.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
