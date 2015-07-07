# for golang
# mkdir $HOME/go
# mkdir -p $GOPATH/src/github.com/user
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Mongo on OSX installed in home directory
[[ $OSTYPE == darwin* ]] && export PATH=$PATH:/usr/local/opt/go/libexec/bin
