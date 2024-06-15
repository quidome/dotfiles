# shellcheck shell=bash

# Exports
# export EDITOR=hx

# Base tooling
# eval "$(starship init zsh)"
# eval "$(zoxide init zsh)"

# Set Aliases
alias qinit='kinit --password-file=STDIN ${USER}@${KRBDOMAIN} <<<$(gopass show ${PWPATH}/krb/${USER})'
alias gitclean='git branch | grep -vE "\*|main|master" | xargs git branch -d'

# alias ll='eza -la'

# alias vim=nvim
# alias vimdiff='nvim -d'

# GnuPG
# export GPG_TTY="$(tty)"
#if TTY=$(tty) ; then

#gpgconf --launch gpg-agent 
#export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

    #export GPG_TTY="${TTY}"
    #gpg-connect-agent updatestartuptty /bye >/dev/null
#fi
