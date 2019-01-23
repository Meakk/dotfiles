#!/bin/bash

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

