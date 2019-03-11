#!/bin/bash
printf "\u$1" | convert -background transparent -fill white -font "/usr/share/fonts/TTF/Nerd Font Complete.ttf" -pointsize 80 -size 144x144 -gravity center label:@- $2
