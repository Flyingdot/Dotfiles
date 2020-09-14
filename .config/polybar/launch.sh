#!/usr/bin/env bash

killall -q polybar

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar example >>/tmp/polybar1.log 2>&1 & disown
#polybar bar2 >>/tmp/polybar2.log 2>&1 & disown

echo "Bars launched..."
