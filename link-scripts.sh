#!/usr/bin/env bash
set -e

DIR="$HOME/programming/shell-scripts/scripts"
cd $DIR

for script in $(ls -1); do
    IFS='.'; arr=($script); unset IFS;
    sudo rm -rf "/usr/bin/${arr[0]}"
    sudo ln -s "$DIR/$script" "/usr/bin/${arr[0]}"
done

cd - > /dev/null
