function fish_greeting
  for c in (set_color -c | head -n 8)
    set -a dots (echo -n -s (set_color $c) ● (set_color br$c) ● "  ")
  end
  set -l highlg (set_color -o yellow)
  set -l accent (set_color -o blue)
  set -l normal (set_color -o normal)

  if test (uname) = "Darwin"
    set -g os "MacOSX"
    set -g packages (brew list -1 | wc -l | sed 's/^ *//')
    set -g uptime (uptime | sed 's/up //' | sed 's/, load.*//')
  else
    set -g os (cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | xargs)
    set -g packages (pacman -Q | wc -l)
    set -g uptime (uptime -p | sed 's/up //')
  end 

  echo -s $dots[1] $highlg $USER "@" (hostname)
  echo -s $dots[2] $accent "OS:       " $normal $os
  echo -s $dots[3] $accent "KERNEL:   " $normal (uname -sr)
  echo -s $dots[4] $accent "UPTIME:   " $normal $uptime
  echo -s $dots[5] $accent "PACKAGES: " $normal $packages
  echo -s $dots[6] $accent "TERMINAL: " $normal $TERMINAL
  echo -s $dots[7] $accent "SHELL:    " $normal (basename $SHELL)
  echo -n -s $dots[8] $accent
  if test -n "$DISPLAY"
    echo -s "WM:       " $normal (xprop -id (xprop -root -notype _NET_SUPPORTING_WM_CHECK | cut -d# -f2 | xargs) -notype -len 100 -f _NET_WM_NAME 8t | grep _NET_WM_NAME | cut -d= -f2 | xargs)
  else
      echo -s "FREE:     " $normal (df -Ph / | tail -1 | awk '{print $4}')
  end
end

