#!/usr/bin/env bash

background=1f1f1fff
foreground=c6c6c6ff
highlight=8abeb7ff
error=a03b1eff

i3lock --blur=10 --clock --indicator --line-uses-inside \
       --insidecolor="$background" --ringcolor="$foreground" \
       --keyhlcolor="$highlight" --bshlcolor="$error" \
       --insidevercolor="$background" --insidewrongcolor="$error" --ringvercolor="$foreground" \
       --ringwrongcolor="$foreground" --separatorcolor="$highlight" --verifcolor="$foreground" \
       --wrongcolor="$foreground" --timecolor="$foreground" --datecolor="$foreground"
