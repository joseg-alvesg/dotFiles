#!/usr/bin/env bash

# The script is only for personal lazy use xD.
# This script is used to start and kill the following:
#  - polybar (and picom) X
#  - bottles-cli (with wow) V
#  - tmux (with htop and clock-mode) V
#  - protonvpn (with eDP-1:'^1') V
#  inside the bspwm window manager.

kill_polybar() {
  killall -q polybar picom
  sleep 1
}

start_bottles() {
  bottles-cli run -b wow -p Wow &> /dev/null &
  sleep 9
  bspc node -d '^2'
}

start_tmux() {
  alacritty --class "AlacrittyGame" \
    -e tmux new-session -A -s "game" 'htop' \; \
    &> /dev/null &
    # split-window -h \; \
    # clock-mode \; \
  sleep 2
  bspc node -m HDMI-1
  sleep 1
}

start_protonvpn() {
  bspc desktop -f eDP-1:'^1'
  protonvpn &> /dev/null &
}

usage() {
  echo "Usage: $0 [-a] [-k] [-b] [-t] [-p] [-h]"
  echo "  -a  start all"
  echo "  -k  kill all (polybar and picom)"
  echo "  -b  start bottles-cli (with wow)"
  echo "  -t  start tmux (with htop and clock-mode)"
  echo "  -p  start protonvpn (with eDP-1:'^1')"
  echo "  -h  show this help"
  exit 1
}

while getopts "akbtph" opt; do
  case $opt in
    a)
      kill_polybar
      start_bottles
      start_tmux
      start_protonvpn
      ;;
    k)
      kill_polybar
      ;;
    b)
      start_bottles
      ;;
    t)
      start_tmux
      ;;
    p)
      start_protonvpn
      ;;
    h)
      usage
      ;;
  esac
done

if [ $# -eq 0 ]; then
  usage
fi
