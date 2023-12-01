function fcd -d "Fuzzy change directory"
    cd ~/
    cd (fd -td -d3 $argv[1] | fzf --border --reverse --height 50%)
    # An improvement that could be made is to have another command that
    # instead of fd that creates the list of files that should be selectable.
    # This script could use fd internally but would give more control over
    # which directories are returned.
end
