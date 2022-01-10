#!/usr/bin/env bash

set -e

declare -A layouts

layouts[us]="gr"
layouts[gr]="gb"
layouts[gb]="us"

current=$(xkblayout-state print "%s")
next=${layouts[$current]}

setxkbmap $next
notify-send -t 2000 -i "/usr/share/icons/flag-icons-main/flags/4x3/$next.svg" "Keyboard Layout"
