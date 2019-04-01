#!/usr/bin/python3
# By: Cami Carballo
# LAST EDITED: 1 April 2019

# Script to get xinput info and set props for touchpad

import os

# get info about devices
os.system("xinput --list > devices.txt")
with open("devices.txt") as devices:
    for device in devices:
        device = device.split()
        if "Touchpad" in device:
            for d in device:
                if d.startswith("id="):
                    dev_id = d.split('=')[1]
            break
    
os.system("rm -f devices.txt")

# get info about props
wanted = [
"Tapping Enabled",
"Natural Scrolling Enabled"
]
prop_ids = []

os.system("xinput list-props {} > props.txt".format(dev_id))
with open("props.txt") as props:
    for prop in props:
        prop = prop.lstrip()
        for p in wanted:
            if p in prop and "Default" not in prop:
                for pr in prop.split():
                    if pr.startswith('('):
                        prop_ids.append(pr.strip("(").strip(":").strip(")"))

os.system("rm -f props.txt")

for i in prop_ids:
    os.system("xinput set-prop {} {} 1".format(dev_id, i))
