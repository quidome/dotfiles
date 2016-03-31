function git_tracks() {
  local "REMOTE_BRANCH=$(git status|awk -F \' '/Your branch/ {print $2}')"
  echo ${REMOTE_BRANCH}
  return 0
}

function git_reset() {
  git fetch origin && git reset --hard $(git_tracks)
}

# alias git_reset='git fetch origin && git reset --hard origin/develop'
