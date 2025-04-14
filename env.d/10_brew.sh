# Homebrew setup
if command -v brew >/dev/null ; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  alias brew-edit="\${EDITOR} \${HOMEBREW_BUNDLE_FILE}"

  export PATH="${HOMEBREW_PREFIX}/opt/openssl/bin:$PATH"
  export HOMEBREW_BUNDLE_FILE="${HOME}/.config/brew/Brewfile"
fi
