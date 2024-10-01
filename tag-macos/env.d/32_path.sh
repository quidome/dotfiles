# shellcheck shell=bash
[ -x "$HOME"/bin ] && export PATH=$PATH:$HOME/bin
[ -x "$HOME"/.scripts ] && export PATH=$PATH:$HOME/.scripts
[ -x "$(brew --prefix)/opt/libpq/bin" ] && export PATH=$PATH:"$(brew --prefix)/opt/libpq/bin"
