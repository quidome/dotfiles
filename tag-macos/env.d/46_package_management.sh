# shellcheck shell=bash disable=SC2139

export HOMEBREW_BUNDLE_FILE="${HOME}/.config/brew/Brewfile"

alias brew-edit="${EDITOR} ${HOMEBREW_BUNDLE_FILE}"
