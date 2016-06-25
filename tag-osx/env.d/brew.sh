if [[ $OSTYPE == darwin* ]]; then
  # HOMEBREW_GITHUB_API_TOKEN should be set

  # Symlink to /Applications
  export HOMEBREW_CASK_OPTS=--appdir=/Applications

  # Add sbin from brew to PATH
  export PATH="$(brew --prefix)/sbin:$PATH"
fi

# update and clean brew, including casks
function brewyouthemother() {
  BREW_BIN=$(command -v brew)

  $BREW_BIN update
  $BREW_BIN upgrade

  $BREW_BIN cleanup
  $BREW_BIN cask cleanup

  $BREW_BIN doctor
  $BREW_BIN cask doctor
}
