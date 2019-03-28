#!/usr/bin/python
# By: Cami Carballo
# LAST EDITED: 28 March 2019

import os

files = ["wakelock"]

for file_ in files:
    f_str = "/home/camelot/.dotfiles/systemd/" + file_ + ".service"
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
