function fish_prompt
    set -l __last_command_exit_status $status

    function _length
        if test (uname) = 'Linux'
            echo $argv[1] | sed -r "s/[[:cntrl:]]\[[0-9]{1,3}m//g" | wc -L
        else
            echo $argv[1] | sed -E "s/[[:cntrl:]]\[[0-9]{1,3}m//g" | wc -m
        end
    end

    function _caret
        if test $USER = 'root'
            echo -n -s (set_color -o red) "# "
        else
            echo -n -s (set_color -o green) "\$ "
        end
    end

    function _git_commit_hash
        echo -s (set_color -o magenta) (git rev-parse --short HEAD ^/dev/null)
    end

    function _git_branch_name
        if set -l branch (git rev-parse --abbrev-ref HEAD ^/dev/null)
            if test $branch = "HEAD"
                echo -s (set_color -o red) DETACHED
            else
                echo -s (set_color -o green) (string replace -r '^refs/heads/' '' $branch)
            end
        end
    end

    function _git_prompt_status
        set -l index (git status -s --ignore-submodules ^/dev/null)
        set -l git_state ""
        for val in $index
            if string match -q -r '^\?' $val
                set git_state (echo -s $git_state (set_color -o white) "◒")
            end
            if string match -q -r '^.M' $val
                set git_state (echo -s $git_state (set_color -o brred) "⚑")
            else if string match -q -r '^M' $val
                set git_state (echo -s $git_state (set_color -o yellow) "⚑")
            end
            if string match -q -r '^A' $val
                set git_state (echo -s $git_state (set_color -o green) "✚")
            end
            if string match -q -r '^R' $val
                set git_state (echo -s $git_state (set_color -o blue) "▴")
            end
            if string match -q -r '^U' $val
                set git_state (echo -s $git_state (set_color -o cyan) "§")
            end
            if string match -q -r '^D' $val
                set git_state (echo -s $git_state (set_color -o red) "✖")
            end
        end
        echo $git_state
    end

    function _git_prompt_dirty
        set -l dirty_status (git status -s --ignore-submodules ^/dev/null)
        if test $status -eq 0
            if test (count $dirty_status) -ne 0
                echo -s (set_color -o red) " ✗"
            else
                echo -s (set_color -o green) " ✔"
            end
        end
    end

    function _git_time_since_commit
        set -l last_commit (git log --pretty=format:'%at' -1 ^/dev/null)
        if test $status -eq 0
            set -l now (date +%s)
            set -l seconds_since_last_commit (math "$now - $last_commit")

            set -l minutes (math "floor($seconds_since_last_commit / 60)")
            set -l hours (math "floor($seconds_since_last_commit / 3600)")
            set -l days (math "floor($seconds_since_last_commit / 86400)")

            set -l sub_hours (math "$hours % 24")
            set -l sub_minutes (math "$minutes % 60")

            set_color -o white
            if test $hours -gt 24
                echo -s $days d
            else if test $minutes -gt 60
                echo -s $sub_hours h $sub_minutes m
            else
                echo -s $minutes m
            end
        end
    end

    set -g fish_prompt_pwd_dir_length 0
    set -l cwd (echo -s (set_color -o blue) (prompt_pwd))
    set -l connec (echo -s (set_color -o yellow) (whoami) '@' (hostname))

    set -l header_left (echo -s $connec ' ' $cwd ' ' (_git_branch_name) (_git_prompt_dirty))
    set -l header_right (echo -s (_git_prompt_status) ' ' (_git_time_since_commit) ' ' (_git_commit_hash))

    set -l fill_spaces (math (tput cols) - (_length $header_right) - (_length $header_left))

    echo
    echo -n -s $header_left
    if test $fill_spaces -gt 0
        echo -n -s (string repeat -n $fill_spaces " ") $header_right
    end
    echo

    if test $__last_command_exit_status -ne 0
        echo -n -s (set_color -o red) '<' $__last_command_exit_status '> '
    end

    echo -n -s (_caret) (set_color -o white)
end
