
# The emacs function opens the given arguments in Emacs
# using a new frame.

# Currently this script only works if you are running Emacs
# in a window-system. It will break things if you try to run
# it from the terminal.

# The values that make sense for the alternate editor are
# emacs and "".

# When you use emacs it will start a new instance of emacs.
# This will in turn start the server.

# When you use the empty string as the alternate editor and
# you are unable to connect start emacs in daemon mode and
# try to connect again.

function emacs
    # -c    Create a new frame
    # -q    Show no messages on success
    # -a    If the emacs server cannot be found run emacs.
    # -n    Do not wait for the emacs server to return.
    emacsclient -c -n -q -a emacs $argv
end
