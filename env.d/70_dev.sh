# shellcheck shell=bash
dev () {
  local workspace url localPath
  workspace="$HOME/dev"

  if ! command -v git > /dev/null 2>&1
  then
    echo Cannot find git
    return 1
  fi

  if [ $# -ne 1 ]
  then
    echo Usage:
    # echo "\t$(basename $0) <git url>"
    printf '\t%s\n' "$(basename "$0")"
    return 1
  fi

  url=$1
  localPath="$workspace/$(_path_from_url "$url")"

  if [ ! -e "$localPath" ]
  then
    git clone "$url" "$localPath" || return 1
  fi

  cd "$localPath" || exit 1
}

cddev () {
  local repo_path
  if repo_path=$(fd -H -td '\.git$' "$DEV_PATH" | xargs dirname | fzf -q "$1") && [ -d "$repo_path" ]; then
    cd "$repo_path" || exit 1
  fi
}

_path_from_url () {
  perl -pe 's!
    ^(?<prot>\w+://)? # Capture the protocol part (e.g. "ssh://")
    (?<username>\w+@)?
    (?<domain>(\w+\.)*\w+\.\w+) # capture the domain
    (?<port>:[0-9]+)?
    [:/](?<path>.*)(\.git$) # Capture the path
  !$+{domain}/$+{path}!x' <<< "$1"
}
