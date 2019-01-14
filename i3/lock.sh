#!/usr/bin/env bash
ffmpeg -loglevel quiet -y -f x11grab -video_size `xdpyinfo | grep -oP 'dimensions:\\s+\\K\\S+'` -i $DISPLAY -i ~/.config/i3/morty.png -filter_complex "boxblur=5:5,overlay=((main_w-overlay_w)/2):(main_h-overlay_h-10)" -vframes 1 /tmp/lock_screen.png

locktext=
insidecolor=00000000
ringcolor=1f1f1fff
keyhlcolor=8abeb7ff
bshlcolor=8abeb7ff
separatorcolor=00000000
insidevercolor=00000000
insidewrongcolor=d23c3dff
ringvercolor=ffffffff
ringwrongcolor=ffffffff
verifcolor=ffffffff
timecolor=ffffffff
datecolor=ffffffff
loginbox=00000066
lockargs=

i3lock \
    -t -i /tmp/lock_screen.png \
    --timepos='x+110:h-70' \
    --datepos='x+43:h-45' \
    --clock --date-align 1  \
    --insidecolor=$insidecolor --ringcolor=$ringcolor --line-uses-inside \
    --keyhlcolor=$keyhlcolor --bshlcolor=$bshlcolor --separatorcolor=$separatorcolor \
    --insidevercolor=$insidevercolor --insidewrongcolor=$insidewrongcolor \
    --ringvercolor=$ringvercolor --ringwrongcolor=$ringwrongcolor --indpos='x+280:h-70' \
    --radius=30 --ring-width=6 --veriftext='' --wrongtext='' \
    --verifcolor="$verifcolor" --timecolor="$timecolor" --datecolor="$datecolor" \
    --noinputtext='' --force-clock $lockargs
