# shellcheck shell=bash
alias qinit='kinit --password-file=STDIN ${USER}@${KRBDOMAIN} <<<$(gopass show ${PWPATH}/krb/${USER})'
alias gitclean='git branch | grep -vE "\*|main|master" | xargs git branch -d'

alias ll='eza -la'
