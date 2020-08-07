#!/bin/sh

# Display
xrdb -merge ~/.Xresources

# Settings
setxkbmap -layout us -variant altgr-intl

# Variables
export PATH=$PATH:/var/lib/snapd/desktop/applications
export XDG_DATA-DIRS=$XDG_DATA_DIRS:/var/lib/snapd/desktop/applications

exec /bin/i3

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto


