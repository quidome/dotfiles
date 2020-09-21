# shellcheck shell=bash
# Setup GnuPG

if TTY=$(tty) ; then
    export GPG_TTY="${TTY}"
    gpg-connect-agent updatestartuptty /bye >/dev/null
fi
