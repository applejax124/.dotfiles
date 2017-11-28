#!/usr/bin/python

# Low Battery Notification on i3wm 
# by: Cami Carballo
# LAST EDIT: 27 November 2017

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

  if status == "Discharging" and percentage <= 5:
    os.system(notify_critical)
  elif status == "Discharging" and percentage <= 10:
      os.system(notify_v_low)
  elif status == "Discharging" and percentage <= 20:
      os.system(notify_low)

  time.sleep(300)
