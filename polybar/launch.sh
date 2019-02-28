#!/usr/bin/env sh

pkill polybar

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

lines=$(polybar -m | sed -e 's/:.*$//g')
for mon in $lines
do
  if [ "$polybar_top" = true ] ; then
    CHECKUPDATES_DB=$(mktemp -d) MONITOR=$mon polybar topbar &
  fi

  if [ "$polybar_bottom" = true ] ; then
    CHECKUPDATES_DB=$(mktemp -d) MONITOR=$mon polybar bottombar &
  fi
done
