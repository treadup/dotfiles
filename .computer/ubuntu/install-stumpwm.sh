#!/bin/bash

# Install StumpWM dependencies
# I'm not sure this is really needed. Just installing "stumpwm" below will probably
# pull in all the required dependencies.
sbcl --eval '(ql:quickload "clx")' --quit
sbcl --eval ' (ql:quickload "cl-ppcre")' --quit
sbcl --eval ' (ql:quickload "alexandria")' --quit
sbcl --eval '(ql:quickload "xembed")' --quit  # Needed by stumptray
sbcl --eval '(ql:quickload "clx-truetype")' --quit # Needed by ttf-fonts

# Install StumpWM
sbcl --eval '(ql:quickload "stumpwm")' --quit

# Fetch stumpwm-contrib
git clone https://github.com/stumpwm/stumpwm-contrib.git ~/.stumpwm.d/modules
