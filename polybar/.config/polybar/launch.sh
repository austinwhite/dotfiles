#!/usr/bin/env bash

# terminate already running bar instances
killall -q polybar

# wait until the process have ben shut disown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch bar
polybar bottom &

echo "Bars launched..."
