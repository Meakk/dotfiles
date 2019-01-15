#!/bin/env sh

pkill polybar

eth=$(ip link show | grep enp | sed -E "s/.*(enp.*):.*/\1/g" | head -n 1)
wlan=$(ip link show | grep enp | sed -E "s/.*(wlp.*):.*/\1/g" | head -n 1)

lines=$(polybar -m | sed -e 's/:.*$//g')
for mon in $lines
do
  WLAN=$wlan ETH=$eth MONITOR=$mon polybar topbar &
done
