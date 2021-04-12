# shellcheck shell=bash
# editor
export EDITOR=nvim
export GUI_EDITOR=nvim

#export BROWSER=$HOME/bin/browser

# location for repos and such
export SRC_PATH="${HOME}/src"
export REPOS_PATH="${HOME}/repos"

# aliases
alias delkey=func_ssh_delete_key

func_ssh_delete_key() {
  line_number=$1
  if [[ "$OSTYPE" = "darwin"* ]]; then
    # use bsd sed
    sed -i'' -E "${line_number}d" "$HOME/.ssh/known_hosts"
  elif [[ "$OSTYPE" = "linux-gnu"* ]]; then
    # regular gnu sed
    sed -i "${line_number}d" "$HOME/.ssh/known_hosts"
  fi
}


show() {
    search_term=$1
    grep --color -E "${search_term}|$"
}
