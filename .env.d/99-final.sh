# These shell tools want to be last in zshrc
eval "$(zoxide init zsh )"

if [[ $TERM != "dumb" ]]; then
  eval "$(starship init zsh)"
fi

eval "$(direnv hook zsh)"
