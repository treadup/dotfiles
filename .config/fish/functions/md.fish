function md -d "Create a directory and cd to it"
    if command mkdir -p $argv
        cd $argv
    end
end
