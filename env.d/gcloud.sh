# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/Applications/google-cloud-sdk/path.zsh.inc" ]; then source "${HOME}/Applications/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/Applications/google-cloud-sdk/completion.zsh.inc" ]; then source "${HOME}/Applications/google-cloud-sdk/completion.zsh.inc"; fi

# set aliases for kubectx and kubens
alias kns=kubens
alias kctx=kubectx
