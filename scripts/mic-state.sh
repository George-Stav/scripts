#!/usr/bin/env bash

echo $(amixer get Capture | grep Left: | awk -F '[][]' '{print $4}')
