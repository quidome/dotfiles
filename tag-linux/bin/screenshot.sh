#!/bin/env sh

# requires:
#   xdotool
#   scrot
#   import

screenshot_path=${HOME}/pictures/screenshots
screenshot_id=$(date +%F_%H%M%S_%N)


if [ $# -eq 0 ]
  then
      echo "No arguments supplied"
      exit 1
fi

filename="${screenshot_path}/${screenshot_id}_${1}.png"

case "$1" in
    win)
	import -window "$(xdotool getwindowfocus -f)" $filename
	;;
    sel)
	import $filename
	;;
    scrn)
	scrot $filename
	;;
    *)
	echo invalid
	exit 1
	;;
esac
