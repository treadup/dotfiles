# The to function implements fast navigation.
# Just type to location and you will go there.
# There is no add/update/remove bookmark functionality.
# Just add new locations in the code below.
function to
    switch "$argv[1]"
        case "bookmark"
            cd ~/code/python/personal-website/website/templates/website/bookmarks/
        case "code"
            cd ~/code
        case "c"
            cd ~/code/C
        case "fish"
	    cd ~/.config/fish/functions
        case "notes"
            cd ~/notes
        case "python"
            cd ~/code/python
	case "website"
	    cd ~/code/python/personal-website
	case ""
            echo "Usage: to <location>"
            echo "where <location> can be one of the following."
            echo "bookmark"
            echo "c"
            echo "code"
            echo "fish"
            echo "notes"
            echo "python"
	    echo "website"
	case "*"
	    echo "Unknown location: $argv[1]"
    end
end
