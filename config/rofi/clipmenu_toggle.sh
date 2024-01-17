#!/usr/bin/env bash

state_file="$HOME/.clipmenu_state"

if [ -f "$state_file" ]; then
  current_state=$(cat "$state_file")
else
  current_state="disabled"
fi

if [ "$current_state" = "disabled" ]; then
  clipctl enable
  echo "enabled" > "$state_file"
  dunstify "Clipmenu" -r 1000 -u low "Clipmenu enabled"
else
  clipctl disable
  echo "disabled" > "$state_file"
  dunstify "Clipmenu" -r 1000 -u low "Clipmenu disabled"
fi
