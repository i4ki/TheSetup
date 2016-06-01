#!/bin/bash

setxkbmap -model abnt2 -layout br

exec rio -launcher dmenu_run -virtuals 2 &

exec sleeper



