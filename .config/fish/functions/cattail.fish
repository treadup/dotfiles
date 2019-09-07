function cattail --description "cattail <file1> ... <fileN>"
    # Same as tail -f except that it starts from
    # the beginning of the file.

    tail -f -n +0 $argv
end
