#!/bin/sh

xrandr --output eDP1 --mode 1920x1080 --pos 3440x239 --rotate normal --output DP1 --primary --mode 3440x1440 --pos 0x0 --rotate normal --output DP2 --off --output DP3 --off --output DP4 --off --output HDMI1 --off --output VIRTUAL1 --off
nitrogen --restore &
