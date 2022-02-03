#!/usr/bin/python3
# By: Camila Thompson
# LAST EDIT: 2 February 2022

import os

files = ["wakelock"]

for file_ in files:

    f_str = "/home/camelot/.dotfiles/systemd/" + file_ + ".service"
    e_str = "/etc/systemd/system/" + file_ + ".service"

    # check for wants
    wants = []
    with open(f_str) as f:
        for line in f.readlines():
            try:
                l = line.split("=")
                if l[0] == "WantedBy":
                    wants.append(l[1].strip())
            except:
                pass

    for want in wants:
        w_str = "/etc/systemd/system/" + want + ".wants"
        if os.path.isfile("{}/{}.service".format(w_str, file_)):
            os.system("sudo rm {}/{}.service".format(w_str, file_))
        os.system("sudo ln -s {} {}/{}.service".format(f_str, w_str, file_))

    #copy service to /etc/systemd/system/
    if file_ == "gdm":
        os.system("sudo rm /etc/systemd/system/display-manager.service")
    if os.path.isfile(e_str):
        os.system("sudo rm {}".format(e_str))
    os.system("sudo cp {} {}".format(f_str, e_str))

    # enable service
    os.system("sudo systemctl enable {}".format(e_str))
