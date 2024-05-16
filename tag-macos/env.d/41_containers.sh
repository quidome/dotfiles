
if command -v colima >/dev/null 2>&1 ; then
  export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"
fi
