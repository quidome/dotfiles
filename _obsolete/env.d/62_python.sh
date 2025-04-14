# shellcheck shell=bash disable=SC1091,SC2039,SC2046,SC1090

# add path to local install python apps
[ -d "${HOME}/.local/bin" ] && export PATH=$PATH:${HOME}/.local/bin

# set place to store virtualenvs
export WORKON_HOME=~/.virtualenvs

