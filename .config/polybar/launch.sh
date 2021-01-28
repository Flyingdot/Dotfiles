#!/usr/bin/env bash
killall -q polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi


# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
# polybar main >>/tmp/polybar1.log 2>&1 & disown

echo "Bars launched..."
