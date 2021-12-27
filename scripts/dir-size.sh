#!/usr/bin/env bash
set -e

du -bd 1 $argv | sort -n | numfmt --to iec
