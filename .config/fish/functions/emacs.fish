function emacs
    # Check if the Emacs process is started. If not then
    # start it. Wait for the Emacs server to be available.
    # Use emacsclient to connect to the server.
    switch (uname)
	case Linux
            if not _is_emacs_process_started
                fish -c 'command emacs &'
            end
	    if test -n "$argv"
		_wait_for_emacs_server
		emacsclient -n -q -a false $argv
	    end
	case Darwin
	    if not _is_emacs_process_started
		open -a Emacs
	    end
	    if test -n "$argv"
		_wait_for_emacs_server
		emacsclient -n -q -a false $argv
	    end
	case '*'
	    echo "I do not know how to run Emacs on this operating system"
    end
end

# Check if the emacs server is up and running
function _is_emacs_server_started
    emacsclient -q --eval 't' --alternate-editor false 1> /dev/null 2> /dev/null
end

# Check if the emacs process is up and running
function _is_emacs_process_started
    switch (uname)
	case Linux
	    ps -A | grep [e]macs
	case Darwin
	    ps -A | grep [/]Applications[/]Emacs.app[/] > /dev/null
	case '*'
	    echo "I do not know how to check if Emacs is running on this operating system"
    end
end

# Wait for the emacs server to be up and running.
# Timeout after 7 seconds.
function _wait_for_emacs_server
    for i in (seq 1 7)
	if _is_emacs_server_started
            # echo "Emacs server is started"
	    return 0
	else
            # echo "Emacs server is not started"
	    sleep 1
	end
    end
    echo "Could not connect to the Emacs server. Timing out."
    return 1
end
