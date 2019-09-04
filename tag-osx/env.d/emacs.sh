# shellcheck shell=bash
# My emacs env settings
#
# When running dmg installed version from https://emacsformacosx.com/
# remember to create some symlinks in /usr/local/bin
#
# ln -sf /Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_9/* /usr/local/bin

# settings
#export EDITOR="emacsclient -t"                  # $EDITOR should open in terminal
#export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI with non-daemon as alternate

# aliases
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias emax="emacsclient -t"                      # used to be "emacs -nw"
alias semac="sudo emacsclient -t"                # used to be "sudo emacs -nw"
alias emacsc="emacsclient -c -a emacs"           # new - opens the GUI with alternate non-daemon
