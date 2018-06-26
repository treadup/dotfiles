#!/bin/bash

# Run or raise emacs
wmctrl -x -a Emacs || emacsclient -c -n -q -a emacs
