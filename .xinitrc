#!/usr/local/plan9/bin/rc

machinename=`{hostname}

if(~ $machinename 'i4k=notebook')
	~/.screenlayout/home.sh
if not 
	~/.screenlayout/work.sh

setxkbmap -model abnt2 -layout br

plumber
riostart
rio -term 9term -virtuals 5 &
sleeper







