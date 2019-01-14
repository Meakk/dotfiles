#!/bin/env sh

pkill polybar

sleep 1;

MONITOR=eDP-1 polybar topbar &
MONITOR=DP-1-2 polybar topbar &
MONITOR=DP-1-3 polybar topbar &
