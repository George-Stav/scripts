#!/usr/bin/env bash
set -e

if [[ $1 -ge 0 && $1 -le 10 ]]; then
    echo "120000 * $1 / 10" | bc | sudo tee /sys/class/backlight/intel_backlight/brightness > /dev/null
else
    printf "Invalid brightness level. \nScript only accepts numbers in range [0,10]."
fi
