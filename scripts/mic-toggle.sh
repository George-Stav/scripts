#!/usr/bin/env bash

msgTag="micstate"

amixer set Capture toggle > /dev/null

state=$(amixer get Capture | grep Left: | awk -F '[][]' '{print $4}')
if [[ $state == "on" ]]; then
    dunstify -t 3000 -a "micToggle" -u low -i "~/.local/share/icons/sound/check.png" -h string:x-dunst-stack-tag:$msgTag "Mic active"
else
    dunstify -t 3000 -a "micToggle" -u low -i "~/.local/share/icons/sound/remove.png" -h string:x-dunst-stack-tag:$msgTag "Mic muted"
fi
