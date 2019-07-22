# Generic stuff
alias ll='exa -l'
alias lg='ll --git'

# cssh
alias cssh='i2cssh -p ${ITERM_PROFILE} -b'

# linux clipboard stuff
if [ "$OS" = linux ]; then
    alias cbcopy='xclip -selection clipboard'
    alias cbpaste='cbcopy -o'
fi
