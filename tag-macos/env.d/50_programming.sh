# shellcheck shell=bash

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
  eval "$(fnm env)"
fi

# Polyglot language manager: mise
if command -v mise >/dev/null ; then
  eval "$(mise activate zsh)"
fi

# SDKMan
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"
