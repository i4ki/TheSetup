#!/bin/rc

machinename=`{ hostname }

monitors=`{xrandr | grep -v disconnected | grep connected | wc -l}

if(~ $monitors 1)
	echo 'no external monitor plugged'
if not {
	if(~ $machinename i4k-notebook)
		$home/.screenlayout/home.sh
	if not 
		$home/.screenlayout/work.sh
}

setxkbmap -model abnt2 -layout br

plumber
riostart
rio -launcher dmenu_run -virtuals 2 &
sleeper

