#!/bin/bash
# Place in ~/.config and run this script, ideally, as an Application Shortcut.
# Feel free to remove comments

# Getting the status of the toggle
x=$(cat ~/.config/toggle)

if [[ "$x" == "on" ]]
then
    # Killing active "widget"; changing the toggle to "off"
    wmctrl -ic $(xdotool search --name HTOGGLER_V1)
    echo "off" > ~/.config/toggle
    # If you have VLC installed, you can play a sound effect by uncommenting 
    # the below and replacing the brackets
    # cvlc {sound effect file path} vlc://quit > /dev/null 2>&1
else
    # Start XFCE4 terminal with no decorations with zoom level -3 and 50x10 
    # geometry in the top right corner
    # Learn more about geometry at X(7): 
    # https://manpages.ubuntu.com/manpages/bionic/en/man7/X.7.html
    xfce4-terminal --hide-borders --hide-toolbar --hide-menubar --hide-scrollbar --geometry=50x10-0+0 --zoom=-2 --command="htop" --title="HTOGGLER_V1" &
    sleep 0.25
    # Forcing the terminal to stay in front of all windows while open while 
    # removing the taskbar tab; changing the toggle to off.
    wmctrl -r "HTOGGLER_V1" -b add,above,skip_taskbar
    echo "on" > ~/.config/toggle
fi
