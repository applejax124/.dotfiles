#!/usr/bin/python
# by: Cami Carballo
# LAST EDIT: 26 March 2019

# Script for sending display to external monitor (xrandr) and audio to external speakers (pacmd)

import sys, os, time

edp1 = True
dp1 = False
dp2 = False

xrandr_tmp = os.popen("xrandr -q")
for line in xrandr_tmp:
    line = line.split()
    try:
        if line[0] == "eDP1":
            if line[1] == "connected":
                edp1 = True
            else:
                edp1 = False
            if line[2] == "primary":
                eprim = True
            else:
                eprim = False
        elif line[0] == "DP1":
            if line[1] == "connected":
                dp1 = True
            else:
                dp1 = False
        elif line[0] == "DP2":
            if line[1] == "connected":
                dp2 = True
            else:
                dp2 = False
    except:
        pass

if edp1 and dp1:
    os.system("xrandr-set HDMI only")
    os.system("pacmd set-card-profile 0 output:hdmi-stereo")
elif not eprim and not dp1:
    os.system("xrandr-set HDMI off")
    os.system("pacmd set-card-profile 0 output:analog-stereo")
