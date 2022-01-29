#!/usr/bin/env bash

set -euo pipefail

internal="eDP-1"
external1="DP-1"
external2="HDMI-1-0"

if [ $(xrandr | grep "$external1" | awk '{print $2}' | sed -n '2 p') == 'connected' ]; then
    xrandr --output $internal --off
    xrandr --rate 144
    xrandr --output $external1 --primary --mode 1920x1080 --rate 144
    [[ $(xrandr | grep "$external2" | awk '{print $2}') == 'connected' ]] && \
        xrandr --output $external2 --mode 1920x1080 --rate 144 --left-of $external1
elif [[ $(xrandr | grep "$external2" | awk '{print $2}') == 'connected' ]]; then
    # xrandr --output $internal --off
    # xrandr --rate 144
    xrandr --output $external2 --primary --mode 1920x1080
fi
