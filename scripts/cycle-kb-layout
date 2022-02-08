#!/usr/bin/env bash
# icons: https://www.flaticon.com/packs/countrys-flags

set -e

declare -A layouts

layouts[us]="gr"
layouts[gr]="gb"
layouts[gb]="us"

current=$(xkblayout-state print "%s")
next=${layouts[$current]}

setxkbmap $next
notify-send -t 2000 -i "/home/george/.local/share/icons/flags/$next.png" "Keyboard Layout"
