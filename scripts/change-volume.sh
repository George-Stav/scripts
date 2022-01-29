#!/usr/bin/env bash

# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "changeVolume"

# Arbitrary but unique message tag
msgTag="myvolume"

# Change the volume using pulseaudio
if [[ $@ == "0" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle > /dev/null
else
    pactl set-sink-volume @DEFAULT_SINK@ "$@" > /dev/null
fi

# Query amixer for the current volume and whether or not the speaker is muted
volume="$(amixer | grep "Front Left:" | head -1 | awk '{print $5}' | sed 's/[^0-9]*//g')"
mute="$(amixer -c 0 get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
if [[ $volume == 0 || "$mute" == "off" ]]; then
    # Show the sound muted notification
    dunstify -t 3000 -a "changeVolume" -u low -i "~/.local/share/icons/sound/mute.png" -h string:x-dunst-stack-tag:$msgTag "Volume muted"
else
    # Show the volume notification
    dunstify -t 3000 -a "changeVolume" -u low -i "~/.local/share/icons/sound/high-volume.png"  -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "Volume: ${volume}%"
fi
