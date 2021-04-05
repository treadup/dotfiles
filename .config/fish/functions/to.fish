# The to function implements fast navigation.
# Just type to location and you will go there.
# There is no add/update/remove bookmark functionality.
# Just add new locations in the code below.
function to
    switch "$argv[1]"
	case "website"
	    cd ~/code/python/personal-website
	case "fish"
	    cd ~/.config/fish/functions
	case ""
	    echo "Usage: to <location>"
	    echo "where <location> can be one of the following."
	    echo "fish"
	    echo "website"
	case "*"
	    echo "Unknown location: $argv[1]"
    end
end
