if [ -d "${HOME}/.rbenv/bin" ]; then

       # include rbenv in path
       export PATH="$HOME/.rbenv/bin:$PATH"

       # init
       eval "$(rbenv init -)"

       # make using gemsets easier
       alias gemset='rbenv gemset'
fi
