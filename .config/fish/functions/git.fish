function git --wraps git
    # Using --wraps will give us the completions for the git command
    if test "$argv[1]" = "temporarily disabled this feature" # previously "new-branch"
        switch $argv[2]
            case 'bugfix/*'
                echo Creating bugfix/ branch
            case 'feature/*'
                echo Creating feature/ branch
            case 'tech/*'
                echo Creating tech/ branch
            case ''
                echo Missing branch name
            case '*'
                echo "Branch names should start with bugfix/, feature/ or tech/."
                return 1
        end
    end
    command git $argv;
end
