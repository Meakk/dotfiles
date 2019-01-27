#!/bin/bash

export PMBG="$(xrdb -query | grep "*theme_bg1" | cut -f 2)"
export PMBG2="$(xrdb -query | grep "*theme_bg2" | cut -f 2)"
export PMFG="$(xrdb -query | grep "*theme_fg" | cut -f 2)"
export PMHL="$(xrdb -query | grep "*theme_hl1" | cut -f 2)"
export PMHL2="$(xrdb -query | grep "*theme_hl2" | cut -f 2)"
export PMUR="$(xrdb -query | grep "*theme_ug" | cut -f 2)"

rofi_command="rofi -theme themes/powermenu.rasi"

# Each of the icon is a selectable element
options=$'\n\n\n'

chosen="$(echo "$options" | $rofi_command -dmenu)"
case $chosen in
    ) # Lock the screen
        sleep 0.3; ~/.config/i3/lock.sh
        ;;
    ) # Shutdown the computer
        systemctl poweroff
        ;;
    ) # Reboot the computer
        systemctl reboot
        ;;
    ) # Log out of the current session
        i3-msg exit
        ;;
esac

