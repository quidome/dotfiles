# Node js envs
eval "$(fnm env --use-on-cd)";

# Pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# jenv setup
PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Other language paths
PATH=$PATH:$HOME/go/bin
PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:"/Applications/IntelliJ IDEA.app/Contents/MacOS"
export PATH

# Set gcloud project for gemini
export GOOGLE_CLOUD_PROJECT=bolcom-pro-gemini-poc
