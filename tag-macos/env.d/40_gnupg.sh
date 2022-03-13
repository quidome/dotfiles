# shellcheck shell=bash
# Setup GnuPG

export GPG_TTY="$(tty)" 
#if TTY=$(tty) ; then

#gpgconf --launch gpg-agent 
#export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

    #export GPG_TTY="${TTY}"
    #gpg-connect-agent updatestartuptty /bye >/dev/null
#fi
