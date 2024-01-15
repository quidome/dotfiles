export EDITOR=hx

# Easy access to helix
v() {
  if [[ $# -eq 0 ]] ; then
    hx .
  else
    hx "$@"
  fi
}
