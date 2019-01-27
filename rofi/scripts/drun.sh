#!/bin/bash

export DRUNBG="$(xrdb -query | grep "*theme_bg1" | cut -f 2)"
export DRUNBG2="$(xrdb -query | grep "*theme_bg2" | cut -f 2)"
export DRUNFG="$(xrdb -query | grep "*theme_fg" | cut -f 2)"
export DRUNHL="$(xrdb -query | grep "*theme_hl1" | cut -f 2)"
export DRUNHL2="$(xrdb -query | grep "*theme_hl2" | cut -f 2)"
export DRUNUR="$(xrdb -query | grep "*theme_ug" | cut -f 2)"

rofi -show drun -display-drun apps -theme ~/.config/rofi/themes/drun.rasi
