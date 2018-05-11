# The esh function opens Eshell in Emacs.
# It does not create a frame if one already exists.

# The values that make sense for the alternate editor are
# emacs and "".

# When you use emacs it will start a new instance of emacs.
# This will in turn start the server.

# When you use the empty string as the alternate editor and
# you are unable to connect start emacs in daemon mode and
# try to connect again.

function esh
    # -q         Show no messages on success
    # -a emacs   If the emacs server cannot be found run emacs.
    # -n         Do not wait for the emacs server to return.
    emacsclient -q -n -e '(esh)' -a "emacs" > /dev/null
end
