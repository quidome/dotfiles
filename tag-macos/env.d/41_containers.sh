# Instead of setting DOCKER_HOME, I'm creating a symlink. Some tooling ignores DOCKER_HOME.
# It is dirty, but it works
if command -v colima >/dev/null 2>&1 && [ ! -L "/var/run/docker.sock" ] ; then
    local docker_link="sudo ln -sf $HOME/.colima/docker.sock /var/run/docker.sock"
    echo $docker_link
    eval ${docker_link}
fi
