#!/bin/bash

interface=`ip addr | grep ".: w" | awk '{print $2}' | sed 's/://g'`
status=`ip addr show wlp2s0 | head -n1 | awk '{print $9}'`
connected_at=`iwconfig wlp2s0 | grep ESSID | sed -n -e 's/^.*ESSID:"\(.*\)".*$/\1/p'`

if [ "x$connected_at" != "x" ]; then
    echo "$interface: $status | Connected: $connected_at"
else
    echo "$interface: $status"
fi

