#!/bin/bash

file=$(find ~/Pictures/anime -type f -not -path "*/.git/*" | shuf -n 1)
xwallpaper --output DP-2 --zoom "$file"

