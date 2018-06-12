# editor
export ALTERNATE_EDITOR=""
export EDITOR='emacsclient -t'

# make qt stuff work
#export PATH="/usr/local/opt/qt/bin:$PATH"

# markdown colors
export MDV_THEME=785.3229

# aliases
alias delkey=func_ssh_delete_key

function func_ssh_delete_key() {
  local line_number=$1
  if [[ $OSTYPE == darwin* ]]; then
    # use bsd sed
    sed -i'' -E "${line_number}d" $HOME/.ssh/known_hosts
  elif [[ $OSTYPE == linux* ]]; then
    # regular gnu sed
    sed -i "${line_number}d" $HOME/.ssh/known_hosts
  fi
}


function show() {
    local search_term=$1

    egrep --color "${search_term}|$"
}
