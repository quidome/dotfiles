# set aliases
alias apl=ansible-playbook

# don't save playbook retries
ANSIBLE_RETRY_FILES_ENABLED=no

function anson(){
    # enable ansible
    workon ansible
    export ANSIBLE_CALLBACK_PLUGINS="$(python -c 'import os,ara; print(os.path.dirname(ara.__file__))')/plugins/callbacks"
}

function ansoff() {
    unset ANSIBLE_CALLBACK_PLUGINS
    deactivate
}
