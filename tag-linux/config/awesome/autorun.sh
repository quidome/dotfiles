#!/usr/bin/env bash

run () {

  if ! ps -C "$(basename "$1")" ;
  then
    "$@" &
  fi
}

#run /bin/xss-lock -- /bin/i3lock -c 263238 -n
