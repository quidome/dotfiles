# shellcheck shell=bash
# Setup GnuPG

GPG_TTY="$(tty)"
export GPG_TTY
#if TTY=$(tty) ; then

#gpgconf --launch gpg-agent 
#export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

    #export GPG_TTY="${TTY}"
    #gpg-connect-agent updatestartuptty /bye >/dev/null
#fi
