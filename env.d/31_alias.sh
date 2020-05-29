# shellcheck shell=bash
# Generic stuff
alias ll='exa -l'
alias lg='ll --git'

# cssh
if [[ "$OS" == "darwin"* ]]; then
    alias cssh='i2cssh -p ${ITERM_PROFILE} -b'
fi

# linux clipboard stuff
if [ "$OS" = linux ]; then
    alias cbcopy='xclip -selection clipboard'
    alias cbpaste='cbcopy -o'
fi
