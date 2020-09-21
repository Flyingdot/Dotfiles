#!/usr/bin/env bash

killall -q polybar

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar dp0 >>/tmp/polybar1.log 2>&1 & disown
polybar dp1 >>/tmp/polybar2.log 2>&1 & disown

echo "Bars launched..."
