#!/bin/bash

dir=~/Pictures/anime
choice=$( find $dir -maxdepth 1 -type f -printf "%f\n" | rofi -dmenu -p "yay")

if [[ -n "$choice" ]] then
  xwallpaper --output DP-2 --zoom $dir/$choice 
fi
