# Vagrant aliases

if [ $(command -v vagrant) ] ; then
  VAGRANT_BINARY=$(command -v vagrant)
  alias va=vagrant
  alias vacd='cd ${PUPPET_VAGRANT}'
  alias vad="${VAGRANT_BINARY} destroy"
  alias vah="${VAGRANT_BINARY} halt"
  alias vap="${VAGRANT_BINARY} provision"
  alias vas="${VAGRANT_BINARY} status"
  alias vassh="${VAGRANT_BINARY} ssh"
  alias vau="${VAGRANT_BINARY} up"

  export VAGRANT_DEFAULT_PROVIDER=virtualbox
fi
