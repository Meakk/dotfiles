# QT theming
set -x QT_QPA_PLATFORMTHEME qt5ct
set -x QT_LOGGING_RULES "qt5ct.debug=false"

# preferred tools
set -x TERMINAL kitty
set -x EDITOR vim

# SXHKD fix
set -x SXHKD_SHELL /usr/bin/bash

# desktop configuration
set -x polybar_top true
set -x polybar_bottom false
set -x polybar_wlan wlan0
set -x polybar_eth eth0
set -x polybar_tun tun0
set -x polybar_bat BAT0

# fish colors
set -x fish_color_command 8BE9FD --bold
set -x fish_color_quote F1FA8C
set -x fish_color_redirection FF79C6
set -x fish_color_end F1FA8C

# special config
if test $hostname = 'toad'
  set -x TERMINAL alacritty
  set -x polybar_bottom true
  set -x polybar_bat BATC
end
if test $hostname = 'bowser'
  set -x polybar_wlan wlp5s0
  set -x polybar_eth enp3s0
end
