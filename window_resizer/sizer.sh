#!/bin/bash
# $1 = window name, $2 = xdo process ID

# An example resize. You can add as many more if statements for more window names.
if [[ "$1" == *"YouTube - Mozilla Firefox"* ]]
then
    # Resizing and then moving the given window to the top left screen corner
    xdotool windowsize $2 931 508
    xdotool windowmove $2 0 0
    exit
fi
