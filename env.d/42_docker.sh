# shellcheck shell=bash
fedora()
{
    local container_name=my_fedora
    local image_name='fedora'
    func_rundocker "${container_name}" "${image_name}"
}


debian()
{
    local container_name=my_debian
    local image_name=debian
    func_rundocker "${container_name}" "${image_name}"
}


arch() {
    local container_name=my_arch
    local image_name='archlinux/base:latest'

    func_rundocker "${container_name}" "${image_name}"
}


func_rundocker() {
    # check arguments
    if [ $# -ne 2 ]; then
	echo "Arguments mismatch: need 2, got ${#}"
    else
	local docker_status container_name image_name
	container_name=${1}
	image_name=${2}

	docker_status=$(docker ps -a -f name="${container_name}$" --format '{{.Status}}')

	if [[ -z "$docker_status" ]]; then
	    echo "no traces of ${container_name} found, run a new one"
	    docker run --name "${container_name}" -h "${container_name}.local" -i -t "${image_name}" /bin/bash
	elif [[ $docker_status =~ ^Up ]]; then
	    echo "attaching to running ${container_name} instance: ${docker_status}"
	    docker attach "${container_name}"
	else
	    echo "restarting stopped ${container_name} instance: ${docker_status}"
	    docker start -a -i "${container_name}"
	fi
    fi
}
