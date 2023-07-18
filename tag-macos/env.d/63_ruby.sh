# shellcheck shell=bash

if test -f "${HOME}/.rbenv/bin/rbenv"; then
    # include rbenv config if available
    eval "$(~/.rbenv/bin/rbenv init - zsh)"

    # make using gemsets easier
    alias gemset='rbenv gemset'

elif test -d "$HOME/.rvm/bin/" ; then
    # otherwise include rvm config if available
    # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
    export PATH="$PATH:$HOME/.rvm/bin"
fi
