eval "$(docker-machine env docker-vm)"

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
