# for golang
# mkdir $HOME/go
# mkdir -p $GOPATH/src/github.com/user
export GOPATH=${HOME}/go
[[ $OSTYPE == darwin* ]] && export GOROOT=/usr/local/opt/go/libexec

export PATH=${PATH}:${GOROOT}/bin:${GOPATH}/bin
