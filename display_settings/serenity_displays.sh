#!/bin/bash
sleep 2
xrandr --output HDMI1 --rotate left --left-of VGA1 
notify-send "Display settings updated."
