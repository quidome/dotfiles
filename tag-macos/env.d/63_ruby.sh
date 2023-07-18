# shellcheck shell=bash

if test -d "${HOME}/.rbenv/bin"; then
    # include rbenv config if available
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"

    # make using gemsets easier
    alias gemset='rbenv gemset'

elif test -d "$HOME/.rvm/bin/" ; then
    # otherwise include rvm config if available

    # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
    export PATH="$PATH:$HOME/.rvm/bin"
fi
