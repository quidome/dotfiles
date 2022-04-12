# shellcheck shell=bash disable=SC1091

# The next line updates PATH for the Google Cloud SDK.
[ -f "${HOME}/opt/google-cloud-sdk/path.zsh.inc" ] && . "${HOME}/opt/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
[ -f "${HOME}/opt/google-cloud-sdk/completion.zsh.inc" ] && . "${HOME}/opt/google-cloud-sdk/completion.zsh.inc"

# set aliases for kubectx and kubens
alias kns=kubens
alias kctx=kubectx