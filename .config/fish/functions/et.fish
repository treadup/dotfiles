
# The et function opens the given arguments in Emacs
# in the terminal.

# The values that make sense for the alternate editor are
# emacs and "".

# When you use emacs it will start a new instance of emacs.
# This will in turn start the server.

# When you use the empty string as the alternate editor and
# you are unable to connect start emacs in daemon mode and
# try to connect again.

function et
    # -t         Open in the current terminal
    # -q         Show no messages on success
    # -a emacs   If the emacs server cannot be found run emacs.
    emacsclient -t -q -a emacs $argv
end
