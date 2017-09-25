VIRTUALENVWRAPPER_PYTHON=$(which python2)
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# uncomment following lines to load a virtualenv when opening a shell
# if (tty -s); then
#   workon py3
# fi

# gpip function allows to pip install in global config
gpip2(){
  PIP_REQUIRE_VIRTUALENV="" pip2 "$@"
}

gpip3(){
  PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}
