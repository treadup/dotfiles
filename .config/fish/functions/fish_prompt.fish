function fish_prompt
    # TRAMP does not work with a fancy prompt.
    # Therefore supply a prompt for dumb terminals.
    if test $TERM = "dumb"
        echo "\$ "
    else
        # Conda does not use the virtualenv variable.
        if test -n "$CONDA_DEFAULT_ENV"
            set_color cyan
            printf '%s ' (basename $CONDA_DEFAULT_ENV)
            set_color normal
        else if test -n "$PIPENV_ACTIVE"
	    # When running pipenv shell you want to use `pipenv shell --fancy`
	    # By setting PIPENV_SHELL_FANCY=1 pipenv will use the --fancy option by default.
	    if test -n "$VIRTUAL_ENV"
                set_color cyan
	        printf '%s ' (basename $VIRTUAL_ENV | rev | cut -d"-" -f2-  | rev)
	        set_color normal
            end
        else if test -n "$VIRTUAL_ENV"
            set_color cyan
            printf '%s ' (basename $VIRTUAL_ENV)
            set_color normal
        end

        set -l prompt_git_branch (git branch 2>/dev/null | grep '^*' | colrm 1 2)

        set_color green
        printf "%s@%s " (whoami) (prompt_hostname)
        set_color normal

        if test -n "$prompt_git_branch"
            set_color magenta
            printf "%s " $prompt_git_branch
            set_color normal
        end

        set_color white
        printf "%s" (prompt_pwd)
        set_color normal

	set_color 555
        printf "%s" (date +" %Y-%m-%d %H:%M:%S")
	set_color normal

        # Lowercase lambda on new line
        printf "\n\u03BB "
    end
end
