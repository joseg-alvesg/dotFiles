#!/usr/bin/env bash

awk 'last {print "<small>",$0,"\t",last,"</small>"} {last=""} /^-/{last=$0}' ~/.config/bspwm/keybindings |
  column -t -s $'\t' |
  rofi -dmenu -i -p "keybinds" -markup-rows -no-show-icons widht 100 -lines 15 -yoffset 40
