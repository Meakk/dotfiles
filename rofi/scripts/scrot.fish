#!/usr/bin/env fish

# padding depending on resolution
set -l resolution (xrandr | grep (bspc query -m -M --names) | sed -r 's/(.*) ([[:digit:]]+x[[:digit:]]+)(.*)/\2/')
set -l padding (expr (echo $resolution | cut -d 'x' -f 2) / 2 - 100)px (expr (echo $resolution | cut -d 'x' -f 1) / 2 - 320)px

switch (echo -e "\n\nﬓ" | rofi -theme ~/.cache/wal/scrot.rasi -dmenu -theme-str "window { padding: $padding; }")
    case  # Scrot a rectangular area
        set -l color (string split "," (cat ~/.cache/wal/slop))
        for i in 1 2 3; set color[$i] (math $color[$i]/255); end
        set -l slop (slop -f "%g" -c (string join "," $color),1.0 -b 3 -p 2 -t 0)
        if test -n $slop
            set -l img (date +"%Y-%m-%d-%H%M%S")_(echo $slop | cut -d "+" -f 1).png
            import -window root -crop $slop ~/$img
            notify-send "Screeshot saved : $img"
        end
    case  # Scrot the whole screen
        sleep 1
        set -l img (date +"%Y-%m-%d-%H%M%S")_desktop.png
        import -window root ~/$img
    case ﬓ # Scrot the active window
        sleep 1
        set -l img (date +"%Y-%m-%d-%H%M%S")_window.png
        import -window (bspc query -n -N) ~/$img
end
