#!/bin/bash

# Low Battery Notification on i3wm 
# by: Cami Carballo
# LAST EDIT: 11 July 2017

BATTINFO=`acpi -b`

if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 10% ]
  ; then
    notify-send "BATTERY LOW" "$BATTINFO"
else if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 20% ]]
  ; then
    notify-send "BATTERY LOW" "$BATTINFO
