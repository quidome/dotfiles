# shellcheck shell=bash

# Add Intellij to path
PATH=$PATH:'/Applications/IntelliJ IDEA.app/Contents/MacOS'

# Direnv
if command -v direnv >/dev/null 2>&1 ; then  
  eval "$(direnv hook zsh)"
fi

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
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  . /opt/homebrew/opt/nvm/nvm.sh
fi

# Polyglot language manager: mice
if command -v mise >/dev/null ; then
  eval "$(mise activate zsh)"
fi
