#!/bin/sh

echo $(ip address show dev tun0 2> /dev/null | grep inet | awk '{print $2}' | cut -f2 -d ':')

