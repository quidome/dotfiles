# shellcheck shell=bash disable=SC1091

# add path to local install python apps
[ -d "${HOME}/.local/bin" ] && export PATH=$PATH:${HOME}/.local/bin

# set place to store virtualenvs
export WORKON_HOME=~/.virtualenvs

case "$OSTYPE" in 
  linux*) . /usr/bin/virtualenvwrapper.sh ;;
  darwin) . /usr/local/bin/virtualenvwrapper.sh ;;
esac

# gpip function allows to pip install in global config
gpip2(){
  PIP_REQUIRE_VIRTUALENV="" pip2 "$@"
}

gpip3(){
  PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}
