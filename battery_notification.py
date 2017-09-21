#!/usr/bin/python

# Low Battery Notification on i3wm 
# by: Cami Carballo
# LAST EDIT: 20 September 2017

# i3 config file (v4)

import sys, os, time

while True:
  batt = os.popen("acpi -b", 'r')

  battinfo = batt.read()
  battinfo = battinfo.split()

  percentage = int(battinfo[3].replace('%,', ""))
  status = battinfo[2].replace(',', "")

  notify_low = "zenity --warning --text='BATTERY LOW: {}%'".format(percentage)
  notify_v_low = "zenity --warning --text='BATTERY VERY LOW: {}%'".format(percentage)
  notify_critical = "zenity --warning --text='BATTERY CRITICAL: {}%'".format(percentage)

  low = False
  v_low = False
  critical = False

  if low == False:
    if status == "Discharging" and percentage <= 20:
      os.system(notify_low)
      low = True

  if v_low == False:
    if status == "Discharging" and percentage <= 10:
      os.system(notify_v_low)
      v_low = True

  if critical == False:
    if status == "Discharging" and percentage <= 5:
      os.system(notify_critical)
      critical = True

  time.sleep(300)
