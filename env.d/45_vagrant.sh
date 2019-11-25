# shellcheck shell=bash disable=SC2139
# Vagrant aliases and more

VAGRANT_BINARY=:
if [ "$(command -v vagrant)" ] ; then
  VAGRANT_BINARY="$(command -v vagrant)"
  alias v="${VAGRANT_BINARY}"
  alias vacd='cd ${PUPPET_VAGRANT}'
  alias cd_vagrant='cd ${PUPPET_VAGRANT}'
  alias vhalt="${VAGRANT_BINARY} halt"
  alias vprov="${VAGRANT_BINARY} provision"
  alias vstatus="${VAGRANT_BINARY} status"
  alias vssh=func_vssh
  alias vup="${VAGRANT_BINARY} up"

  export VAGRANT_DEFAULT_PROVIDER=virtualbox
fi