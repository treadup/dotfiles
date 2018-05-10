function save-buffers-kill-emacs
    # Run the command (save-buffers-kill-emacs) on an existing emacs server.
    # Use true as the alternate editor so that we do not launch
    # a new Emacs instance.
    emacsclient -e '(save-buffers-kill-emacs)' -a "true"
end
