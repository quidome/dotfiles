# shellcheck shell=bash
if [ -x "$HOME"/bin ]; then
  export PATH=$PATH:$HOME/bin
fi

[ -x "$HOME"/.scripts ] && export PATH=$PATH:$HOME/.scripts
