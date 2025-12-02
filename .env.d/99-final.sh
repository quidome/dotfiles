# These shell tools want to be last in zshrc
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh )"
fi

if [[ $TERM != "dumb" ]]; then
  eval "$(starship init zsh)"
fi

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi
