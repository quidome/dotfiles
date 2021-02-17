# shellcheck shell=bash
# Generic stuff
alias ll='exa -l'
alias lg='ll --git'
alias vimdiff='nvim -d'

# cssh
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias cssh='i2cssh -p ${ITERM_PROFILE} -b'
fi

# linux clipboard stuff
if [[ "$OSTYPE" = "linux-gnu"* ]]; then
    alias cbcopy='xclip -selection clipboard'
    alias cbpaste='cbcopy -o'
fi
