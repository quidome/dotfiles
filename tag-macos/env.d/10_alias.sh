# shellcheck shell=bash
alias ll='exa -la'

alias vim=nvim
alias vi=nvim
alias vimdiff='nvim -d'
alias qinit='kinit --password-file=STDIN ${USER}@${KRBDOMAIN} <<<$(gopass show ${PWPATH}/krb/${USER})'

alias gitclean='git branch | grep -vE "\*|main|master" | xargs git branch -d'
