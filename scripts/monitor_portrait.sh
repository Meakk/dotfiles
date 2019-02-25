#!/bin/sh
xrandr --orientation normal
xinput set-prop 13 --type=float "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
bspc wm -r
