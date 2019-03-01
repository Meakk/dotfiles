function fish_greeting
  ufetch
  for c in (set_color -c | head -n 8)
    echo -n -s (string repeat -n 4 " ")
    echo -n -s (set_color $c) "●" (set_color br$c) "●"
  end
  echo
end

