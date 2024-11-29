# shellcheck shell=bash

# Exports
export EDITOR=hx
export DEV_PATH="${HOME}/dev"
export PATH=$PATH:${HOME}/bin

# Base tooling
source <(fzf --zsh)
eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd=j)"

# Set Aliases
alias qinit='kinit --password-file=STDIN ${USER}@${KRBDOMAIN} <<<$(gopass show ${PWPATH}/krb/${USER})'
alias gitclean='git branch | grep -vE "\*|main|master" | xargs git branch -d'

alias ll='eza -la'

alias vim=nvim
alias vimdiff='nvim -d'
