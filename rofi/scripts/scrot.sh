#!/bin/bash

rofi_command="rofi -theme themes/scrot.rasi"

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
