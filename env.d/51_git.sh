alias git_reset=func_git_reset
alias git_bd=func_git_delete_branches
alias gsp='git stash; git pull; git stash pop'

git_check_changes() {
    local search_path='.'
    local repo_path git_result exit_code ahead changes

    # set search_path if given
    if [ -e "$1" ]; then
	search_path="$1"
    fi

    # get status of all git repos found under search_path
    for repo_path in $(find "${search_path}" -name .git -type d|xargs dirname); do
	git_result=$(git -C "$repo_path" status -sb --porcelain --untracked-files=no)
	exit_code=$?

	if [ ${exit_code} -eq 0 ]; then
	    ahead=$(echo "${git_result}" | head -1 | grep -c ahead)
	    changes=$(echo "${git_result}" | tail -n +2 | wc -l)

	    if [ "${ahead}" -gt 0 ] || [ "${changes}" -gt 0 ] ; then
		echo -e "${repo_path}\n${git_result}\n"
	    fi
	else
	    echo -e "Error occured:\n${git_result}"
	fi

    done
}


func_git_reset() {
  git fetch origin && git reset --hard "$(func_git_get_tracking_branch)"
}

func_git_get_local_branch() {
  local local_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  local retval=$?
  echo "${local_branch}"
  return ${retval}
}

func_git_get_tracking_branch() {
  local git_status retval remote_branch

  git_status=$(git status 2> /dev/null)
  retval=$?
  if [ ${retval} -eq 0 ]; then
    # git was happy, parse results
    remote_branch=$(echo "${git_status}" | awk -F \' '/Your branch/ {print $2}')

    if [ X"" != X"${remote_branch}" ]; then
      echo "X0"
      echo "X${remote_branch}"
      echo "${remote_branch}"
      retval=0
    else
      retval=1
    fi
  else
    retval=1
  fi

  return ${retval}
}

func_git_get_remote_branch() {
  local retval remote_branch remote_tracking

  # Get remote tracking
  remote_tracking=$(func_git_get_tracking_branch)
  retval=$?

  if [ ${retval} -eq 0 ]; then
    # we got something
    remote_branch=$(echo "${remote_tracking##*/}")
    if [ "X0" != "X${remote_branch}" ]; then
      echo "${remote_branch}"
    else
      retval=1
    fi
  fi
  return ${retval}
}

func_git_delete_branches() {
    for branch in $(git branch --merged|grep -vE '(develop|master|\*)'); do
	git branch -d "$branch"
    done
}


func_git_get_remote_refname() {
    local rem_branch
    rem_branch=$(git for-each-ref --format='%(refname:short)' "$(git symbolic-ref -q HEAD)")
    echo "$rem_branch"
}


func_git_grep_recursive() {
    if [ $# -eq 0 ]
    then
	echo "No arguments supplied"
    else
	search=${1}
	if [ -z "$2" ]
	then
	    spath=.
	else
	    spath=${2}
	fi

	for repo in $(find "${spath}" -type d -name .git) ; do
	    output=$(git -C "${repo%/*}" --no-pager grep "${search}")
	    if [ $? -eq 0 ]; then
		echo \#\#\#\#\#\#\#\#\#\# "${repo%/*}"
		echo "${output}"
	    fi
	done
    fi
}
