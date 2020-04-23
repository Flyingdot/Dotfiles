#!/bin/sh

# Display
xrdb -merge ~/.Xresources

# Settings
setxkbmap -layout us -variant altgr-intl

# Variables
export PATH=$PATH:/bin/snap

exec /bin/i3

