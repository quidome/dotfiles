# set place to store virtualenvs
export WORKON_HOME=~/.virtualenvs


if [[ $OSTYPE == darwin* ]] ; then
    source /usr/local/bin/virtualenvwrapper.sh
elif [[ $OSTYPE == linux* ]] ; then
    source /usr/bin/virtualenvwrapper.sh
fi


# gpip function allows to pip install in global config
gpip2(){
  PIP_REQUIRE_VIRTUALENV="" pip2 "$@"
}

gpip3(){
  PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}
