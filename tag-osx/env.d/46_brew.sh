# shellcheck shell=bash
if [[ $OSTYPE == darwin* ]]; then

  # HOMEBREW_GITHUB_API_TOKEN should be set
  [ ${HOMEBREW_GITHUB_API_TOKEN:+1} ] || echo "HOMEBREW_GITHUB_API_TOKEN is unset"

  # Add sbin from brew to PATH
  brew_path=$(brew --prefix)
  export PATH="$PATH:$brew_path/sbin"
fi

# update and clean brew, including casks
function brewyouthemother() {
  BREW_BIN=$(command -v brew)

  $BREW_BIN update
  $BREW_BIN upgrade
  $BREW_BIN cask upgrade

  $BREW_BIN cleanup

  $BREW_BIN doctor
  $BREW_BIN cask doctor
}
