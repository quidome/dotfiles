# shellcheck shell=bash

# set up aliases
alias -- em='emacsclient -t -a '\'''\'''
alias -- find='noglob find'
alias -- idea='open -na "IntelliJ IDEA.app" --args "$@"'
alias -- la='eza -a'
alias -- ll='eza -l'
alias -- lla='eza -la'
alias -- ls=eza
alias -- lt='eza --tree'

# set up gnupg agent
if TTY=$(tty) ; then
    unset SSH_AGENT_PID
    gpgconf --launch gpg-agent
    SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
    export SSH_AUTH_SOCK

    export GPG_TTY="${TTY}"
    gpg-connect-agent updatestartuptty /bye >/dev/null
fi

# Point SSH to gpg-agent
unset SSH_AUTH_SOCK
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
