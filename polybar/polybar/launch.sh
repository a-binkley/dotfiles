#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
# if $() == 2; then
#   MONITOR="DP-1-3" polybar --reload example &
#   MONITOR="eDP-1" polybar --reload example &
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi
#echo "---" | tee -a /tmp/polybar1-$USER.log /tmp/polybar2-$USER.log
#polybar black >>/tmp/polybar1.log 2>&1 & disown
#polybar example -r >>/tmp/polybar1-$USER.log 2>&1 & disown
echo "Bars launched..."

