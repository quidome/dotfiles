# Generic stuff
[[ $OSTYPE == darwin* ]] || alias ls='ls --color=auto'
alias ll='ls -la'

# Sublime
alias s=subl

# i2cssh profile
#alias i2cssh="i2cssh -p light"

alias e='emacsclient -t'

# Atom editor
alias a=atom
alias ap='atom -a'

# archlinux
alias y=yaourt

# neovim
alias vi=nvim
alias vim=nvim
alias vimdiff=nvim\ -d

# command line md viewer
# requires clone of github.com/axiros/terminal_markdown_viewer
alias mdv='${DEV_PATH}/github.com/axiros/terminal_markdown_viewer/mdv.py -t 785.3229 -T 785.3229'
