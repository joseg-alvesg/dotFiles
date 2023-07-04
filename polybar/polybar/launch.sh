#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
if type "xrandr"; then
  if [[ $(xrandr --query | grep 'HDMI-1 connected') ]]; then
    polybar -r top -c ~/.config/polybar/config2.ini &
    polybar -r top_external -c ~/.config/polybar/config2.ini &
  else
    polybar -r top -c ~/.config/polybar/config.ini &
  fi
fi
