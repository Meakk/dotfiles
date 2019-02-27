#!/bin/bash
rofi_command="rofi -theme ~/.cache/wal/powermenu.rasi"

# Each of the icon is a selectable element
options=$'\n\n痢\n襤'

chosen="$(echo "$options" | $rofi_command -dmenu)"
case $chosen in
    ) # Lock the screen
        sleep 0.3; sh $HOME/.cache/wal/lock.sh
        ;;
    襤) # Shutdown the computer
        poweroff
        ;;
    痢) # Reboot the computer
        reboot
        ;;
    ) # Log out of the current session
        bspc quit
        ;;
esac

