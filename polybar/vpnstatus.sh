#!/bin/sh

IFACE=`ip address | grep cscotun0 | wc -l`

if [ $IFACE -ne 0 ]; then
    echo "%{F#666}%{F-} vpn connected"
else
    echo "%{F#666}%{F-} vpn disconnected"
fi
