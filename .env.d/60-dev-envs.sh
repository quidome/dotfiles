# Set up mise
eval "$(mise activate zsh)"

# Other language paths
PATH=$PATH:$HOME/go/bin
PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:"/Applications/IntelliJ IDEA.app/Contents/MacOS"
export PATH

# Set gcloud project for gemini
export GOOGLE_CLOUD_PROJECT=bolcom-pro-gemini-poc
