dev () {
	local workspace url cmd localPath
	workspace="$HOME/Workspace" 

	if ! command -v git > /dev/null 2>&1
	then
		echo Cannot find git
		return 1
	fi

	if [ $# -ne 1 ]
	then
		echo Usage:
		echo "\t$(basename $0) <git url>"
		return 1
	fi

	url=$1 
	localPath="$workspace/$(path_from_url $url)" 

  if [ ! -e $localPath ]
	then
		git clone "$url" "$localPath" || return 1
	fi

  cd $localPath
}

path_from_url () {
  perl -pe 's!
    ^(?<prot>\w+://)? # Capture the protocol part (e.g. "ssh://")
    (?<username>\w+@)?
    (?<domain>(\w+\.)*\w+\.\w+) # capture the domain
    (?<port>:[0-9]+)?
    [:/](?<path>.*)(\.git$) # Capture the path
  !$+{domain}/$+{path}!x' <<< $1
}
