# shellcheck shell=bash disable=SC1090
if [ -d "${HOME}/.rbenv/bin" ]; then

       # include rbenv in path
       export PATH="$HOME/.rbenv/bin:$PATH"

       # init
       eval "$(rbenv init -)"

       # make using gemsets easier
       alias gemset='rbenv gemset'
fi

# Load rvm config and change path
if [ -d "$HOME/.rvm" ] ; then
    . "$HOME/.rvm/scripts/rvm"
    export PATH="$PATH:$HOME/.rvm/bin"
fi
