#!/bin/bash

# Adjust font hinting style
gsettings "set" "org.gnome.settings-daemon.plugins.xsettings" "hinting" "slight"
 
# Enable RGBA anti aliasing
gsettings "set" "org.gnome.settings-daemon.plugins.xsettings" "antialiasing" "rgba"
 
# Activate the lcddefault lcdfilter
echo "Xft.lcdfilter: lcddefault" > ~/.Xresources
  
  
