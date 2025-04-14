# shellcheck shell=bash
if TTY=$(tty) ; then
    unset SSH_AGENT_PID
    gpgconf --launch gpg-agent 
    SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
    export SSH_AUTH_SOCK

    export GPG_TTY="${TTY}"
    gpg-connect-agent updatestartuptty /bye >/dev/null
fi
