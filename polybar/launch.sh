#!/bin/env sh

pkill polybar

eth=$(nmcli dev status | grep ethernet | head -n 1 | cut -d ' ' -f 1)
wlan=$(nmcli dev status | grep wifi | head -n 1 | cut -d ' ' -f 1)
vpn=$(nmcli dev status | grep tun | head -n 1 | cut -d ' ' -f 1)

lines=$(polybar -m | sed -e 's/:.*$//g')
for mon in $lines
do
  CHECKUPDATES_DB=$(mktemp -d) WLAN=$wlan ETH=$eth VPN=$vpn MONITOR=$mon polybar topbar &
done
