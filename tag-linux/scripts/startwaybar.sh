#!/bin/sh

pkill -x waybar
/usr/bin/waybar -c ~/.config/waybar/config-top </dev/null &>/dev/null &
#/usr/bin/waybar -c ~/.config/waybar/config-bottom </dev/null &>/dev/null &
