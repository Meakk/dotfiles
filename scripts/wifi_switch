#!/bin/bash
state="$(nmcli device show wlan0 | grep 'GENERAL.STATE' | sed -e 's/.*(\(.*\))/\1/')"

if [[ $state == "connected" ]]
then
    nmcli d disconnect wlan0
fi

if [[ $state == "disconnected" ]]
then
    nmcli d connect wlan0
fi

