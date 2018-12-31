# checks os and sets env var
if [[ $OSTYPE == linux* ]]; then
    export OS=linux
elif [[ $OSTYPE == darwin* ]] ; then
    export OS=osx
else
    export OS=unknown
fi
