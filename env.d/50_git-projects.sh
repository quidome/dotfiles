# shellcheck shell=bash
# Functions to "manage" git projects

export GITPROJECT=${HOME}/.config/gitproject

alias gpr=func_gitproject
alias opr=func_openproject

func_gitproject() {
  if [ $# -eq 0 ]; then
    echo "## gpr projects in ${GITPROJECT}:"
    ls -1 "${GITPROJECT}"
  else
    project=$1

    # perform git action on project
    if [ -e "${GITPROJECT}/${project}" ] ; then
      while IFS= read -r repo
      do
	      echo "## ${repo}"
	      git -C "${repo}" "${@:2}"
      done < "${GITPROJECT}/${project}"
    else
      echo "${GITPROJECT}/${1} does not exist"
    fi
  fi
}

func_openproject() {
  project=$1

  # perform git action on project
  if [ -e "${GITPROJECT}/${project}" ] ; then
    while IFS= read -r repo
    do
      atom -a "${repo}"
    done < "${GITPROJECT}/${project}"
  else
    echo "${GITPROJECT}/${1} does not exist"
  fi
}
