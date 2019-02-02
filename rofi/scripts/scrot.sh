#!/bin/bash

export SCROTBG="$(xrdb -query | grep "*theme_bg1" | cut -f 2)"
export SCROTBG2="$(xrdb -query | grep "*theme_bg2" | cut -f 2)"
export SCROTFG="$(xrdb -query | grep "*theme_fg" | cut -f 2)"
export SCROTHL="$(xrdb -query | grep "*theme_hl1" | cut -f 2)"
export SCROTHL2="$(xrdb -query | grep "*theme_hl2" | cut -f 2)"
export SCROTUR="$(xrdb -query | grep "*theme_ug" | cut -f 2)"

rofi_command="rofi -theme ~/.cache/wal/scrot.rasi"
# Each of the icon is a selectable element
options=$'\n\n'

chosen="$(echo "$options" | $rofi_command -dmenu)"
case $chosen in
    ) # Scrot a rectangular area
        i3-scrot -s
        ;;
    ) # Scrot the whole screen
        sleep 1; i3-scrot -d
        ;;
    ) # Scrot the active window
        sleep 1; i3-scrot -w
        ;;
esac
