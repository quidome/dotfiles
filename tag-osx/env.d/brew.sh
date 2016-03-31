if [[ $OSTYPE == darwin* ]]; then
  # HOMEBREW_GITHUB_API_TOKEN should be set

  # Symlink to /Applications
  export HOMEBREW_CASK_OPTS=--appdir=/Applications

  # Add sbin from brew to PATH
  export PATH="$(brew --prefix)/sbin:$PATH"
fi
