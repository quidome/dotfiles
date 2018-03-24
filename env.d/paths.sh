if [ -x $HOME/bin ]; then
  export PATH=$PATH:$HOME/bin
fi

# Individual apps:
#[[ $OSTYPE == darwin* ]] && export PATH=$PATH:$HOME/mongodb/mongodb-osx-x86_64-3.0.4/bin

# add latex from brew to path
export PATH="$PATH:/Library/TeX/texbin"
