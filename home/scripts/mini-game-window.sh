#!/bin/bash

alacritty --class "game" \
  -e tmux new-session -A -s "game" 'htop' \; \
  split-window -h \; \
  clock-mode -t 1 \; \
  &> /dev/null &
