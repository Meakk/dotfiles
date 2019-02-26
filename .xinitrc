wal -R
xsetroot -cursor_name left_ptr

if [[ $HOSTNAME = 'bowser' ]]; then
  xrandr --output DVI-I-1 --mode 1920x1080 --rate 144.00
  xinput --set-prop 9 295 -0.8
fi

exec bspwm
