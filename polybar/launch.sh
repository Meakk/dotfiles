#!/bin/env sh

pkill polybar
sleep 1

lines=$(polybar -m | sed -e 's/:.*$//g')
for mon in $lines
do
  MONITOR=$mon polybar topbar &
done
