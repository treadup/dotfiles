function pass
    if count $argv > /dev/null ]
        command pass $argv
    else
        command pass
    end
end
