#!/bin/env sh

pkill polybar

eth=$(ip link show | grep enp | sed -E "s/.*(enp.*):.*/\1/g" | head -n 1)
wlan=$(ip link show | grep wlp | sed -E "s/.*(wlp.*):.*/\1/g" | head -n 1)
vpn=$(ip link show | grep tun | sed -E "s/.*(tun.*):.*/\1/g" | head -n 1)

lines=$(polybar -m | sed -e 's/:.*$//g')
for mon in $lines
do
  CHECKUPDATES_DB=$(mktemp -d) WLAN=$wlan ETH=$eth VPN=$vpn MONITOR=$mon polybar topbar &
done
