#!/usr/bin/env fish

# padding depending on resolution
set -l resolution (xrandr | grep (bspc query -m -M --names) | sed -r 's/(.*) ([[:digit:]]+x[[:digit:]]+)(.*)/\2/')
set -l padding (expr (echo $resolution | cut -d 'x' -f 2) / 2 - 100)px (expr (echo $resolution | cut -d 'x' -f 1) / 2 - 430)px

switch (echo -e "\n\n痢\n襤" | rofi -theme ~/.cache/wal/powermenu.rasi -dmenu -theme-str "window { padding: $padding; }")
    case  # Lock the screen
        sleep 0.3; sh $HOME/.cache/wal/lock.sh
    case 襤 # Shutdown the computer
        poweroff
    case 痢 # Reboot the computer
        reboot
    case  # Log out of the current session
        bspc quit
end
