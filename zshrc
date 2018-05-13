# Set fng Zsh, it'll source the following files in this order by default:
#
# /etc/zshenv (/etc/zsh/zshenv on arch)
#     This file should contain commands to set the global command search path
#     and other system-wide environment variables; it should not contain
#     commands that produce output or assume the shell is attached to a tty.
# ~/.zshenv
#     Similar to /etc/zsh/zshenv but for per-user configuration. Generally used
#     for setting some useful environment variables.
# /etc/zprofile (/etc/zsh/zprofile on arch)
#     This is a global configuration file, it'll be sourced at login. Usually
#     used for executing some general commands at login. Please note that on
#     Arch Linux, by default it contains one line which source the
#     /etc/profile, see #Global configuration files for details.
# /etc/profile
#     This file should be sourced by all Bourne-compatible shells upon login:
#     it sets up an environment upon login and application-specific
#     (/etc/profile.d/*.sh) settings. Note that on Arch Linux, Zsh will also
#     source this by default.
# ~/.zprofile
#     This file is generally used for automatic execution of user's scripts at
#     login.
# /etc/zshrc (/etc/zsh/zshrc on arch)
#     Global configuration file, will be sourced when starting as a interactive
#     shell.
# ~/.zshrc
#     Main user configuration file, will be sourced when starting as an
#     interactive shell.
# /etc/zsh/zlogin
#     A global configuration file, will be sourced at the ending of initial
#     progress when starting as a login shell.
# ~/.zlogin
#     Same as /etc/zsh/zlogin but for per-user configuration.
# /etc/zlogout (/etc/zsh/zlogout on arch)
#     A global configuration file, will be sourced when a login shell exits.
# ~/.zlogout
#     Same as /etc/zsh/zlogout but for per-user configuration.tath first

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
export ZSH_SCRIPTS=".zshrc"
#echo $0: running scripts in .env.d
#echo -----------------------------------
if [ -d $HOME/.env.d ]; then
  for i in $HOME/.env.d/*.sh; do
    if [ -r $i ]; then
      #echo load ${i##*/} $i
      . $i
      export ZSH_SCRIPTS=${ZSH_SCRIPTS}:${i##*/}
    fi
  done
  unset i
fi
# 1:end

# Add .puppethosts to host completion
# do this after .env inclusion to load config vars first
zstyle -s ':completion:*:hosts' hosts _ssh_config
[[ -r ${PUPPET_HOSTS} ]] && _ssh_config+=($(cat ${PUPPET_HOSTS}))
zstyle ':completion:*:hosts' hosts $_ssh_config

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/qmeijer/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/home/qmeijer/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/qmeijer/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/qmeijer/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
