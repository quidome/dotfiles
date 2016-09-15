DEFAULT_DOCKER_MACHINE='default'

# set docker env if local box is running
if [[ $(docker-machine status ${DEFAULT_DOCKER_MACHINE}) == Running ]] ; then
  eval "$(docker-machine env ${DEFAULT_DOCKER_MACHINE})"
fi

function dm() {
    docker-machine ls
}

function dms() {
        if [ $# -eq 0 ]; then
                echo "No arguments supplied"
        else
                machine=${1}
                eval "$(docker-machine env ${machine})"
        fi
}
