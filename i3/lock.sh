#!/usr/bin/env bash

background=$(xrdb -query | grep "*theme_background" | cut -f 2 | tr -d '#')ff
foreground=$(xrdb -query | grep "*theme_foreground" | cut -f 2 | tr -d '#')ff
highlight=$(xrdb -query | grep "*theme_highlight1" | cut -f 2 | tr -d '#')ff
error=$(xrdb -query | grep "*theme_urgent" | cut -f 2 | tr -d '#')ff

i3lock --blur=10 --clock --indicator --line-uses-inside \
       --insidecolor="$background" --ringcolor="$foreground" \
       --keyhlcolor="$highlight" --bshlcolor="$error" \
       --insidevercolor="$background" --insidewrongcolor="$error" --ringvercolor="$foreground" \
       --ringwrongcolor="$foreground" --separatorcolor="$highlight" --verifcolor="$foreground" \
       --wrongcolor="$foreground" --timecolor="$foreground" --datecolor="$foreground" \
       --datestr="%A, %d/%m/%y"
