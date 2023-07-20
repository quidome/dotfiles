# shellcheck shell=bash disable=SC1091
if [ -n "$__PRELOAD_SLOW_THINGS_ONCE" ] || [ -n "$NOSYSZSHRC" ]; then return; fi
export __PRELOAD_SLOW_THINGS_ONCE=1

# The next line enables shell command completion for gcloud.
if [ -f '/Users/qmeijer/Library/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/qmeijer/Library/google-cloud-sdk/completion.zsh.inc'; fi
