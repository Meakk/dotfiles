#!/bin/sh

[ -f ~/.xprofile ] && . ~/.xprofile

exec bspwm

#export DESKTOP_SESSION=plasma
#exec startplasma-x11
