function pbcopy
    switch (uname)
	case Darwin
	    command pbcopy
	case '*'
	    xclip -selection clipboard
    end
end
