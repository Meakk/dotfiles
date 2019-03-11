#!/bin/bash
printf "\u$1" | convert -background transparent -fill white -font "/usr/share/fonts/TTF/Nerd Font Complete.ttf" -pointsize 190 -size 256x256 -gravity center label:@- $2
