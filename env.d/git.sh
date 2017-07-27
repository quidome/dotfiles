alias git_reset=func_git_reset
alias git_bd=func_git_delete_branches
alias gsp='git stash; git pull; git stash pop'

function func_git_reset() {
  git fetch origin && git reset --hard $(func_git_get_tracking_branch)
}

function func_git_get_local_branch() {
  local local_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  local retval=$?
  echo ${local_branch}
  return ${retval}
}

function func_git_get_tracking_branch() {
  local git_status retval remote_branch

  git_status=$(git status 2> /dev/null)
  retval=$?
  if [ ${retval} -eq 0 ]; then
    # git was happy, parse results
    remote_branch=$(echo ${git_status} | awk -F \' '/Your branch/ {print $2}')

    if [ X"" != X"${remote_branch}" ]; then
      echo "X0"
      echo "X${remote_branch}"
      echo ${remote_branch}
      retval=0
    else
      retval=1
    fi
  else
    retval=1
  fi

  return ${retval}
}

function func_git_get_remote_branch() {
  local retval remote_branch remote_tracking

  # Get remote tracking
  remote_tracking=$(func_git_get_tracking_branch)
  retval=$?

  if [ ${retval} -eq 0 ]; then
    # we got something
    remote_branch=$(echo ${remote_tracking##*/})
    if [ "X0" != "X${remote_branch}" ]; then
      echo ${remote_branch}
    else
      retval=1
    fi
  fi
  return ${retval}
}

function func_git_delete_branches() {
    for branch in $(git branch --merged|grep -vE '(develop|master|\*)'); do
	git branch -d $branch
    done
}


function func_git_get_remote_refname() {
    local rem_branch=$(git for-each-ref --format='%(refname:short)' $(git symbolic-ref -q HEAD))
    echo $rem_branch
}


function func_git_grep_recursive() {
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

	for repo in $(find ${spath} -type d -name .git) ; do
	    output="$(git -C ${repo%/*} --no-pager grep ${search})"
	    if [ $? -eq 0 ]; then
		echo \#\#\#\#\#\#\#\#\#\# ${repo%/*}
		echo ${output}
	    fi
	done
    fi
}
