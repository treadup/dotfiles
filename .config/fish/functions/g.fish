function g --wraps git
    # Using --wraps will give us the completions for the git command
    # when using the new g function.
        git $argv;
end
