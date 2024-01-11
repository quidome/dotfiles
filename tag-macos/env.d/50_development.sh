# shellcheck shell=bash

# Add Intellij to path
PATH=$PATH:'/Applications/IntelliJ IDEA.app/Contents/MacOS'

# Golang
export PATH=$PATH:${HOME}/go/bin

# Python
if command -v pyenv 1> /dev/null 2>&1 ; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Ruby
if test -f "${HOME}/.rbenv/bin/rbenv"; then
  eval "$(~/.rbenv/bin/rbenv init - zsh)"
  alias gemset='rbenv gemset'
fi

# Nodejs
if command -v fnm >/dev/null ; then
  eval "$(fnm env --use-on-cd)"
fi
