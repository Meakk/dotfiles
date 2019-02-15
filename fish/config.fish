# QT theming
set -x QT_QPA_PLATFORMTHEME qt5ct
set -x QT_LOGGING_RULES "qt5ct.debug=false"

# preferred tools
set -x TERMINAL kitty
set -x EDITOR vim

# desktop configuration
set -x i3_polybar_top true
set -x i3_polybar_bottom false
set -x i3_polybar_wlan wlp2s0
set -x i3_polybar_eth eth0
set -x i3_polybar_tun tun0
set -x i3_polybar_bat BAT0

# fish colors
set -x fish_color_command 8BE9FD --bold
set -x fish_color_quote F1FA8C
set -x fish_color_redirection FF79C6
set -x fish_color_end F1FA8C
