#!/bin/bash

up_interface=`ip addr | grep "state UP " | awk '{print $2}' | sed 's/://g'`
status=`ip addr show $up_interface | head -n1 | awk '{print $9}'`
not_wifi=`iwconfig $up_interface 2>&1 | grep "no wireless extensions."`
connected_at=""

if [ "x$not_wifi" == "x" ]; then
	     connected_at=`iwconfig $up_interface 2>&1 | grep ESSID | sed -n -e 's/^.*ESSID:"\(.*\)".*$/\1/p'`
fi

if [ "x$connected_at" != "x" ]; then
    echo "$up_interface: $status | Connected: $connected_at"
else
    echo "$up_interface: $status"
fi

