#!/bin/bash

export SCROTBG="$(xrdb -query | grep "*theme_background" | head -n 1 | cut -f 2)"
export SCROTBG2="$(xrdb -query | grep "*theme_background_light" | cut -f 2)"
export SCROTFG="$(xrdb -query | grep "*theme_foreground" | cut -f 2)"
export SCROTHL="$(xrdb -query | grep "*theme_highlight1" | cut -f 2)"
export SCROTHL2="$(xrdb -query | grep "*theme_highlight2" | cut -f 2)"
export SCROTUR="$(xrdb -query | grep "*theme_urgent" | cut -f 2)"

echo $SCROTBG
echo $SCROTBG2
echo $SCROTFG
echo $SCROTHL
echo $SCROTHL2
echo $SCROTUR

rofi_command="rofi -theme ~/.config/rofi/themes/scrot.rasi"
# Each of the icon is a selectable element
options=$'\n\n'

chosen="$(echo "$options" | $rofi_command -dmenu)"
case $chosen in
    ) # Scrot a rectangular area
        i3-scrot -s
        ;;
    ) # Scrot the whole screen
        sleep 1; i3-scrot -d
        ;;
    ) # Scrot the active window
        sleep 1; i3-scrot -w
        ;;
esac
