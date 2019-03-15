# check some defaults to be used in the scripts:

# check if dev environment is set
[ -z ${DEV_PATH+x} ] && echo "DEV_PATH is unset"
[ -z ${PUPPET_VAGRANT+x} ] && echo "PUPPET_VAGRANT is unset"
