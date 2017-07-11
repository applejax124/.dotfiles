#!/usr/bin/python2.7

# Low Battery Notification on i3wm 
# by: Cami Carballo
# LAST EDIT: 22 May 2017

import os
import sys

# check current battery percentage and discharging status
f = os.popen("upower -i /org/freedesktop/UPower/devices/battery_BAT0")
#battery_info = f.read()
state = os.popen("cat {} | grep state: | cut -f 2 -d ':' | tr -d [:space:]".format(f))
#percentage = os.popen("cat {} | grep percentage: | cut -f 2 -d ':' | tr -d [:space:]".format(battery_info))

if state == "discharging":
    # use notify-send to display warning message at 20% and 10%
    if percentage == "20%":
        os.system("notify-send 'BATTERY LOW 20%'")
    #elif percentage == "10%":
        #os.system("notify-send 'BATTERY LOW 10%'")
    #else:
        #os.system("notify-send {}".format(percentage))
