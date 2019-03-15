# Setup GnuPG
TTY=$(tty)

[[ $? -eq 0 ]] && export GPG_TTY="${TTY}"
gpg-connect-agent updatestartuptty /bye >/dev/null
