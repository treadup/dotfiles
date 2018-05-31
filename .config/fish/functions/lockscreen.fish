function lockscreen
    switch (uname)
        case Linux
	    light-locker-command -l
        case Darwin
            echo "Ctrl-Cmd-Q to lock the screen."
            /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
    end
end
