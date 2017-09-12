VIRTUALENVWRAPPER_PYTHON=$(which python2)
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# uncomment following lines to load a virtualenv when opening a shell
if (tty -s); then
  workon py3
fi
