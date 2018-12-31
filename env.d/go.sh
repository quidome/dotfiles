# for golang
# mkdir $HOME/go
# mkdir -p $GOPATH/src/github.com/user
export GOPATH=${HOME}/go
[ $OS = linux ] && export GOROOT=/usr/local/opt/go/libexec

export PATH=${GOROOT}/bin:${GOPATH}/bin:${PATH}
