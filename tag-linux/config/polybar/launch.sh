#!/usr/bin/env bash

set -x

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

echo passed

if type "xrandr" > /dev/null; then
    for m in $(xrandr --query | grep " connected" | sort | cut -d" " -f1); do
	if [ "$m" == 'eDP-1' ]
	then
	    MONITOR=$m polybar --reload internal -c ~/.config/polybar/config &
	    sleep 2
	else
	    MONITOR=$m polybar --reload external -c ~/.config/polybar/config &
	fi
    done
else
    polybar --reload generic -c ~/.config/polybar/config &
fi
