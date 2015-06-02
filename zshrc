# Set fpath first
fpath=($HOME/.zsh-completion $fpath)

# Prompt
autoload -Uz promptinit
#promptinit
#prompt walters
source ~/.zprompt

# History
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt histignorealldups
setopt sharehistory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Completion
zmodload -i zsh/complist
autoload -Uz compinit
compinit
setopt completealiases
# autoload -U $HOME/.zsh-completion/*.zsh(:t)

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# 1:start
# load everything in .env.d
echo $0: running scripts in .env.d
echo -----------------------------------
if [ -d $HOME/.env.d ]; then
  for i in $HOME/.env.d/*.sh; do
    if [ -r $i ]; then
      echo load $i
      . $i
    fi
  done
  unset i
fi
# 1:end
