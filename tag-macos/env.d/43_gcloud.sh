# shellcheck shell=bash disable=SC1090

source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# set aliases for kubectx and kubens
alias kns=kubens
alias kctx=kubectx
