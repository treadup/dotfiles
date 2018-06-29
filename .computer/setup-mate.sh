#!/bin/bash

#
# Configuration for the MATE desktop.
#

# Set background image
gsettings set org.mate.background picture-filename '/home/henrik/Pictures/rainforest_bridge.png'

# Caps as control key
gsettings set org.mate.peripherals-keyboard-xkb.kbd options "['caps\tcaps:ctrl_modifier']"

# Disable sound effects
gsettings set org.mate.sound input-feedback-sounds false
gsettings set org.mate.sound theme-name '__no_sounds'
gsettings set org.mate.sound event-sounds false

# Set fonts
gsettings set org.mate.interface monospace-font-name 'Ubuntu Mono 16'
gsettings set org.mate.interface font-name 'Ubuntu 16'
gsettings set org.mate.interface document-font-name 'Ubuntu 16'
