#!/usr/bin/env bash

# terminate all current instances
killall -q polybar

# wait until all process have been shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch bar
polybar bottom &

echo "Bars launched..."
