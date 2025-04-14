# shellcheck shell=bash

# Python
if command -v pyenv 1> /dev/null 2>&1 ; then
  # Pyenv setup
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - zsh)"
fi

# Ruby
if test -f "${HOME}/.rbenv/bin/rbenv"; then
  eval "$(~/.rbenv/bin/rbenv init - zsh)"
  alias gemset='rbenv gemset'
fi

# Nodejs
if command -v fnm >/dev/null ; then
  eval "$(fnm env)"
fi

# Polyglot language manager: mise
if command -v mise >/dev/null ; then
  eval "$(mise activate zsh)"
fi

# Java
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

if command -v jenv >/dev/null 2>&1 ; then
  PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# golang
if command -v go >/dev/null 2>&1 ; then
  export PATH="$PATH:$HOME/go/bin"
fi
