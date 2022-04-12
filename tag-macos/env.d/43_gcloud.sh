# shellcheck shell=bash disable=SC1091

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/qmeijer/Library/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/qmeijer/Library/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/qmeijer/Library/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/qmeijer/Library/google-cloud-sdk/completion.zsh.inc'; fi

# set aliases for kubectx and kubens
alias kns=kubens
alias kctx=kubectx
