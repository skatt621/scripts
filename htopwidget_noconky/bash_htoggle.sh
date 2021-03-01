#!/bin/bash
# This script launches a small XFCE4 terminal on the top window layer and runs HTOP (or removes the terminal if it exists).
# Best launched as a keyboard shortcut so that it is easily toggleable.

# Checks to see if the widget is running by checking window titles.
x=$(xdotool search --name HTOGGLER_V1)

if [[ "$x" == "" ]]
then
    # Opens the terminal and runs HTOP with no arguments.
    xfce4-terminal --hide-borders --hide-toolbar --hide-menubar --hide-scrollbar --geometry=80x10-0+0 --zoom=-3 --command="htop" --title="HTOGGLER_V1" &
    sleep 0.25

    # Moves the widget to the top layer and removes the taskbar entry.
    wmctrl -r "HTOGGLER_V1" -b add,above,skip_taskbar
else
    # Closes the terminal.
    wmctrl -ic $x
fi

# If you have VLC installed, you run SFX on open or close by adding the below to either part of the above "if" loop.
#     cvlc ~/.config/caughtslippin.mp3 vlc://quit > /dev/null 2>&1
