# shellcheck shell=bash
if command -v rbenv > /dev/null 2>&1 ; then

    if test -d "${HOME}/.rbenv/bin"; then
        # include rbenv in path
        export PATH="$HOME/.rbenv/bin:$PATH"
    fi

    # init rbenv
    eval "$(rbenv init -)"

    # make using gemsets easier
    alias gemset='rbenv gemset'

    # add zsh completion for rbenv
    . /usr/lib/rbenv/completions/rbenv.zsh
fi

if test -d $HOME/.rvm/bin/ ; then
    # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
    export PATH="$PATH:$HOME/.rvm/bin"
fi
