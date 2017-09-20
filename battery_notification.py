#!/usr/bin/python

# Low Battery Notification on i3wm 
# by: Cami Carballo
# LAST EDIT: 20 September 2017

# i3 config file (v4)

import sys, os

batt = os.popen("acpi -b", 'r')

battinfo = batt.read()
battinfo = battinfo.split()

percentage = int(battinfo[3].replace('%,', ""))
status = battinfo[2].replace(',', "")

notification = "notify-send 'BATTERY LOW: {}%'".format(percentage)

if status == "Discharging" and percentage == 20:
  os.system(notification)

if status == "Discharging" and percentage == 10:
  os.system(notification)

