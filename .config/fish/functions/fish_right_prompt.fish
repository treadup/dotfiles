function fish_right_prompt
    # TRAMP does not work with a fancy prompt.
    # Therefore supply a prompt for dumb terminals.
    if test $TERM = "dumb"
        echo "\$ "
    else
	set_color normal
        date +"%Y-%m-%d %H:%M:%S"
    end
end
