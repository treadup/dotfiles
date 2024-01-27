function mark -d "Bookmark the current directory using the given name"
    if not test -d $HOME/.marks
        mkdir $HOME/.marks
    end

    switch "$argv[1]"
        case "add"
            if not set -q argv[2]
                echo "Bookmark name not provided."
                echo "Bookmark not created."
            else
                set location $argv[2]
                echo "Creating bookmark $location"
                ln -s "$PWD" "$HOME/.marks/$location"
            end
        case ""
            echo "Usage:"
            echo
            echo "mark <bookmark> will change directory to the bookmark location"
            echo
            echo "mark add <bookmark> will add a bookmark to the present directory"
            echo "with the given name"
        case "*"
            set location $argv[1]
            set symlink $HOME/.marks/$location
            if test -d $symlink
                cd $symlink
            else
                echo "Bookmark $location does not exist"
            end
    end
end
