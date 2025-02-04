# shellcheck shell=bash

# Exports
export EDITOR=hx
export DEV_PATH="${HOME}/dev"
export PATH=$PATH:${HOME}/bin

export PATH=$PATH:'/Applications/IntelliJ IDEA.app/Contents/MacOS'

# Base tooling
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# shellcheck source=/opt/homebrew/bin/fzf
source <(fzf --zsh)

# Set Aliases
alias qinit='kinit --password-file=STDIN ${USER}@${KRBDOMAIN} <<<$(gopass show ${PWPATH}/krb/${USER})'
alias gitclean='git branch | grep -vE "\*|main|master" | xargs git branch -d'

alias ll='eza -la'

alias vim=nvim
alias vimdiff='nvim -d'
