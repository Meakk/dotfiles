#!/usr/bin/env fish

# padding depending on resolution
set -l resolution (xrandr | grep (bspc query -m -M --names) | sed -r 's/(.*) ([[:digit:]]+x[[:digit:]]+)(.*)/\2/')
set -l padding (expr (echo $resolution | cut -d 'x' -f 2) / 2 - 100)px (expr (echo $resolution | cut -d 'x' -f 1) / 2 - 320)px

switch (echo -e "\n\nﬓ" | rofi -theme ~/.cache/wal/scrot.rasi -dmenu -theme-str "window { padding: $padding; }")
    case  # Scrot a rectangular area
        i3-scrot -s
    case  # Scrot the whole screen
        sleep 1; i3-scrot -d
    case ﬓ # Scrot the active window
        sleep 1; i3-scrot -w
end
