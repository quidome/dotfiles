# Node js envs
if command -v fnm >/dev/null 2>&1; then
	eval "$(fnm env --use-on-cd)";
fi

# Pyenv setup
if command -v pyenv >/dev/null 2>&1; then
	export PYENV_ROOT="$HOME/.pyenv"
	[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init - zsh)"
fi

# # uv and uvx setup
if command -v uv >/dev/null 2>&1; then
    eval "$(uv generate-shell-completion zsh)"
fi
if command -v uvx >/dev/null 2>&1; then
    eval "$(uvx --generate-shell-completion zsh)"
fi

# sdkman for java
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Mise-en-place setup
if command -v mise >/dev/null 2>&1; then
	eval "$(mise activate zsh)"
fi

# Other language paths
PATH=$PATH:$HOME/go/bin
PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:"/Applications/IntelliJ IDEA.app/Contents/MacOS"
export PATH
