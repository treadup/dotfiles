function lockscreen
    echo "Ctrl-Cmd-Q to lock the screen."
    /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
end
