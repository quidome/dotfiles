# add path to local install python apps
[ -d "${HOME}/.local/bin" ] && export PATH=$PATH:${HOME}/.local/bin

# set place to store virtualenvs
export WORKON_HOME=~/.virtualenvs

[ "$OS" = osx ] && . /usr/local/bin/virtualenvwrapper.sh
[ "$OS" = linux ] && . /usr/bin/virtualenvwrapper.sh

# gpip function allows to pip install in global config
gpip2(){
  PIP_REQUIRE_VIRTUALENV="" pip2 "$@"
}

gpip3(){
  PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}
