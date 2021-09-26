function config
    if git status &> /dev/null
        echo "The config command has been disabled inside a git repo."
        echo "Did you mean to use the git command?"
        return 1
    else
        /usr/bin/git --git-dir=$HOME/.dotconf/ --work-tree=$HOME $argv
    end
end
