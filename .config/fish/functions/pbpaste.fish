function pbpaste
    switch (uname)
	case Darwin
	    command pbpaste
	case '*'
	    xclip -selection clipboard -o
    end
end
