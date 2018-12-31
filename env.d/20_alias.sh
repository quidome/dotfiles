# Generic stuff
alias ll='exa -l'
alias lg='ll --git'


# Atom editor
alias a=atom
alias ap='atom -a'

# archlinux
alias y=yaourt

# cssh
alias cssh='i2cssh -p ${ITERM_PROFILE} -b'

# linux clipboard stuff
if [ $OS = linux ]; then
    alias cbcopy='xclip -selection clipboard'
    alias cbpaste='cbcopy -o'
fi
