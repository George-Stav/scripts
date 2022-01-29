#!/usr/bin/env bash

set -euo pipefail

root_dir="$HOME/Music"
links="$HOME/Documents/notes/weedian-albums.txt"
logs="$root_dir/weedian-dl.log"
# root_dir="$1"
# links_dir="$2"

mkdir -p "$root_dir/WEEDIAN/mp3"
mkdir -p "$root_dir/WEEDIAN/flac"
touch $logs

while read l; do
    link=$(echo $l | awk -F ' - ' '{print $1}')
    album=$(echo $l | awk -F ' - ' '{print $2}')
    format=$(echo $l | awk -F ' - ' '{print $3}')

    output_dir="$root_dir/WEEDIAN/$format/$album"
    mkdir -p $output_dir

    curl $link -o "$output_dir/$album.zip"

    unzip "$output_dir/$album.zip" -d "$output_dir"
done <$links
