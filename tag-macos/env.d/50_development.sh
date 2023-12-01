# shellcheck shell=bash

# Add golang install dir to path
export PATH=$PATH:${HOME}/go/bin

# Add Intellij to path
PATH=$PATH:'/Applications/IntelliJ IDEA.app/Contents/MacOS'

# Manage python with pyenv
if command -v pyenv 1> /dev/null 2>&1 ; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Manage ruby with either rbenv or rvm
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

# Multi language manager rtx (asdf clone)
# used for: nodejs
if command -v rtx 1> /dev/null 2>&1 ; then
    eval "$(rtx activate zsh)"
fi

# Manage languages with sdkman
# used for: java
export SDKMAN_DIR="$SDKMAN_DIR_RAW"
if test -f "${HOME}/.sdkman/bin/sdkman-init.sh"; then
    source "${HOME}/.sdkman/bin/sdkman-init.sh"
fi
