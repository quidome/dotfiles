# check some defaults to be used in the scripts:

# dev stuff
if [ -z ${DEV_PATH+x} ]; then echo "DEV_PATH is unset"; fi
if [ -z ${PUPPET_VAGRANT+x} ]; then echo "PUPPET_VAGRANT is unset"; fi
