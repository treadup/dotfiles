function g --wraps git
    # Using --wraps will give us the completions for the git command
    # when using the new g function.
    if test "$argv[1]" = "new-branch"
        switch $argv[2]
        case 'bugfix/*'
            echo "Creating bugfix/ branch"
        case 'feature/*'
            echo "Creating feature/ branch"
        case 'tech/*'
            echo "Creating tech/ branch"
        case ''
            echo "Missing branch name"
        case '*'
            echo "Branch names should start with bugfix/, feature/ or tech/."
            return 1
        end
    end
    git $argv;
end
