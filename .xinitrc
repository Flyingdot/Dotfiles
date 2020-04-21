#!/bin/sh

xrdb -merge ~/.Xresources

export PATH=$PATH:/bin/snap

exec /bin/i3

