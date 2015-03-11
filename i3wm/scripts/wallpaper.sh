#!/bin/bash

shopt -s nullglob
cd ~/Wallpapers

while true; do
	files=()
	for i in *.jpg *.png; do
		[[ -f $i ]] && files+=("$i")
	done
	range=${#files[@]}

	((range)) && feh --bg-scale "${files[RANDOM % range]}"

	sleep 1m
done
