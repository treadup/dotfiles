function kill-emacs
    # Run the command (kill-emacs) on an existing emacs server.
    # Use true as the alternate editor so that we do not launch
    # a new Emacs instance.
    emacsclient -e '(kill-emacs)' -a "true"
end
