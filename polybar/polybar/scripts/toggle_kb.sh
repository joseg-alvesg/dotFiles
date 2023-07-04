#! /bin/bash

CURRENT_LAYOUT=$(setxkbmap -query|awk -F : 'NR==3{print $2}'|sed 's/ //g')

if [ "$CURRENT_LAYOUT" = "br" ]; then
    setxkbmap "us"
else
    setxkbmap "br"
fi
