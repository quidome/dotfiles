export DEV_PATH=$HOME/dev
export PATH=$PATH:$HOME/bin
export EDITOR=hx

export HOMEBREW_BUNDLE_FILE="$HOME/.config/homebrew/Brewfile"
alias brew-edit="\$EDITOR \$HOMEBREW_BUNDLE_FILE"

# Create link to /var/run/docker.sock
if command -v colima >/dev/null 2>&1 && [ ! -L "/var/run/docker.sock" ] ; then
  local docker_link="sudo ln -sf $HOME/.colima/docker.sock /var/run/docker.sock"
  echo "$docker_link"
  eval $docker_link
fi
