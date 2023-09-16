#!/usr/bin/env bash

if [[ $(xset -q | grep 'Scroll Lock' | awk '{print$12}') == 'on' ]]; then
    xset -led 3
else
    xset led 3
fi
