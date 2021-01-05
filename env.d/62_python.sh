# shellcheck shell=bash disable=SC1091

# add path to local install python apps
[ -d "${HOME}/.local/bin" ] && export PATH=$PATH:${HOME}/.local/bin

# set place to store virtualenvs
export WORKON_HOME=~/.virtualenvs

if WRAPPER=$(command -v virtualenvwrapper.sh) ; then
  # https://github.com/NixOS/nixpkgs/issues/30586
  # work around a source issue on nixos
  source <(sed 's/exec/source/' $WRAPPER)
else
  echo "$0: virtualenvwrapper.sh not found in path"
fi

# gpip function allows to pip install in global config
gpip2(){
  PIP_REQUIRE_VIRTUALENV="" pip2 "$@"
}

gpip3(){
  PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}
