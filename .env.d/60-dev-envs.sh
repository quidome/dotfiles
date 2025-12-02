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

# jenv setup
if command -v jenv >/dev/null 2>&1; then
	PATH="$HOME/.jenv/bin:$PATH"
	eval "$(jenv init -)"
fi

# Mise-en-place setup
if command -v mise >/dev/null 2>&1; then
	eval "$(mise activate zsh)"
fi

# Other language paths
PATH=$PATH:$HOME/go/bin
PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:"/Applications/IntelliJ IDEA.app/Contents/MacOS"
export PATH

# Set gcloud project for gemini
export GOOGLE_CLOUD_PROJECT=bolcom-pro-gemini-poc
