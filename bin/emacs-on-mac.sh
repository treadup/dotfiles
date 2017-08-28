#!/bin/sh
# This script is so that we can execute the latest version of Emacs from the command line.
# Without this script when you execute the emacs command it will start an older version of Emacs.

# Create a symlink from ~/bin/emacs to this file.

$(/Applications/Emacs.app/Contents/MacOS/Emacs "$@") &

