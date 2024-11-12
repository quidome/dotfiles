# Load auto complete for brew install of google-cloud-sdk
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# set aliases for kubectx and kubens
alias k=kubectl
alias kn=kubens
alias kc=kubectx
alias gcl='gcloud auth login'
