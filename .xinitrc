#!/bin/rc

machinename=`{ hostname }

if(~ $machinename i4k-notebook)
	$home/.screenlayout/home.sh
if not 
	$home/.screenlayout/work.sh

setxkbmap -model abnt2 -layout br

plumber
riostart
rio -term 9term -virtuals 5 >[2=1]>$home/rio.log & 
sleeper







