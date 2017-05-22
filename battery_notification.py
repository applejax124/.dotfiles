#!usr/bin/python

# Low Battery Notification on i3wm 
# by: Cami Carballo
# LAST EDIT: 21 May 2017

import os

# set battery variable to location of default battery
BATTERY = "/org/freedesktop/UPower/devices/battery_BAT0"

# check current battery percentage and discharging status
battery_info = os.popen("upower -i %s", BATTERY, "r").read()
state = os.popen("cat %s | grep state: | cut -f 2 -d ":" | tr -d [:space:]", battery_info, "r")
percentage = os.popen("cat %s | grep percentage: | cut -f 2 -d ":" | tr -d [:space:]", battery_info, "r")

if state == "discharging":
    # use notify-send to display warning message at 20% and 10%
    if percentage == "20%":
        os.system("notify-send "BATTERY LOW (20%)" ")
    elif percentage == "10%":
        os.system("notify-send "BATTERY LOW (10%)" ")
    else
        pass
