#!/usr/bin/env bash
background={background.strip}ff
foreground={foreground.strip}ff
highlight={color1.strip}ff
error={color1.strip}ff

pkill -u "$USER" -USR1 dunst

i3lock --nofork --blur=10 --clock --indicator --line-uses-inside \
       --insidecolor="$background" --ringcolor="$foreground" \
       --keyhlcolor="$highlight" --bshlcolor="$error" \
       --insidevercolor="$background" --insidewrongcolor="$error" --ringvercolor="$foreground" \
       --ringwrongcolor="$foreground" --separatorcolor="$highlight" --verifcolor="$foreground" \
       --wrongcolor="$foreground" --timecolor="$foreground" --datecolor="$foreground" \
       --datestr="%A, %d/%m/%y"

pkill -u "$USER" -USR2 dunst
