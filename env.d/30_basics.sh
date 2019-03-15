# editor
export EDITOR=vim

# make qt stuff work
#export PATH="/usr/local/opt/qt/bin:$PATH"

# markdown colors
export MDV_THEME=785.3229

# aliases
alias delkey=func_ssh_delete_key

func_ssh_delete_key() {
  line_number=$1
  if [ "$OS" = osx ]; then
    # use bsd sed
    sed -i'' -E "${line_number}d" "$HOME/.ssh/known_hosts"
  elif [ "$OS" = linux ]; then
    # regular gnu sed
    sed -i "${line_number}d" "$HOME/.ssh/known_hosts"
  fi
}


show() {
    search_term=$1
    grep --color -E "${search_term}|$"
}
