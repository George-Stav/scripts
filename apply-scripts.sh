#!/usr/bin/env bash
set -e

DIR="$HOME/dev/scripts/scripts"
cd $DIR

for s in $(ls -1); do
    IFS='.'; arr=($s); unset IFS;
    script=${arr[0]}
    sudo rm -f "/usr/bin/$script"
    sudo cp "$DIR/$s" "/usr/bin/$script"
done

cd - > /dev/null
