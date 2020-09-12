# Imports
import os
import subprocess
from subprocess import PIPE
from subprocess import Popen

# Using xdotool to get xdo process IDs for program windows
subprocess.run("xdotool search --onlyvisible --name \".*?\" > xdopids", shell=True, stdout=subprocess.PIPE)

# Opening the xdo process ID file and adding them to a list then removing any empty list elements
f = open("xdopids", "r")
xdopids = f.read().split("\n")
f.close
for i in xdopids:
    if len(i) == 0:
        xdopids.remove(i)

# Removing duplicates from the xdo process ID list and creating a new list with xdo IDs and their associated window names
xdopids = list(set(xdopids))
name_xdopid = []

for i in xdopids:
    p=subprocess.run("xdotool getwindowname {0} 2>&1".format(i), shell=True, stdout=subprocess.PIPE)
    name=p.stdout.decode('utf-8').strip()

    if len(name) > 1:
        name_xdopid.append([name, i])

# Running the resizing script on each window
for i in name_xdopid:
    p=subprocess.run("./sizer.sh '{0}' '{1}' > /dev/null 2>&1".format(i[0], i[1]), shell=True, stdout=subprocess.PIPE)

# Removing the xdo process ID file
os.remove("xdopids")
