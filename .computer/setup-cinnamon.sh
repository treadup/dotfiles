#!/bin/bash

# Cinnamon is configured using the System Settings application.
# To see the changes that are being made you can use the command
# dconf watch /

# Cinnamon stores its configuration settings in the org.cinnamon
# schema.

#
# System
#

# Log out
# Log out is already mapped to Ctrl+Alt+Delete

# Lock screen using Super+l
gsettings set org.cinnamon.desktop.keybindings.media-keys screensaver "['<Super>l']"

#
# Fonts
#
echo Configuring fonts
gsettings set org.cinnamon.desktop.interface font-name 'Sans 12'
gsettings set org.nemo.desktop font 'Noto Sans 13'
gsettings set org.gnome.desktop.interface document-font-name 'Sans 14'
gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono 15'
gsettings set org.cinnamon.desktop.wm.preferences titlebar-font 'Sans Bold 12'

#
# Background image
#
echo Configuring background image
if [ -f ~/Pictures/rainforest_bridge.png ]; then
    BACKGROUND_PATH="file://$(realpath ~/Pictures/rainforest_bridge.png)"
    gsettings set org.cinnamon.desktop.background picture-uri $BACKGROUND_PATH
fi

#
# Windows
#

# Maximize window using Ctrl+Super+f
gsettings set org.cinnamon.desktop.keybindings.wm toggle-maximized "['<Primary><Super>f']"

# Cycle through windows of the same application using Super+Tab
gsettings set org.cinnamon.desktop.keybindings.wm switch-group "['<Super>Tab']"

# Close window using Super+w
gsettings set org.cinnamon.desktop.keybindings.wm close "['<Primary><Super>w']"

# Toggle fullscreen state using Super+f
gsettings set org.cinnamon.desktop.keybindings.wm toggle-fullscreen "['<Super><Shift>f']"

# Show desktop
# Show desktop is already mapped to Super+d

#
# Workspaces
#
echo Configuring workspaces
gsettings set org.cinnamon.desktop.wm.preferences num-workspaces 9

gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-1 "['<Super>1']"
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-2 "['<Super>2']"
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-3 "['<Super>3']"
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-4 "['<Super>4']"
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-5 "['<Super>5']"
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-6 "['<Super>6']"
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-7 "['<Super>7']"
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-8 "['<Super>8']"
gsettings set org.cinnamon.desktop.keybindings.wm switch-to-workspace-9 "['<Super>9']"

#
# Custom key bindings
#

echo Configuring custom keybindings

# Create slots for custom keybindings custom0 through custom4.
gsettings set org.cinnamon.desktop.keybindings custom-list "['custom0', 'custom1', 'custom2', 'custom3', 'custom4', 'custom5']"


CUSTOM_KEYBINDINGS=org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/

# Firefox

# Run or raise Firefox using Ctrl+Super+b
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ name "Run or raise Firefox"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ command "run-or-raise Firefox firefox"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ binding "['<Primary><Super>b']"

# Launch new Firefox using Shift+Super+b
gsettings set org.cinnamon.desktop.keybindings.media-keys www "['<Shift><Super>b']"

# Spotify
# For some reason this keybinding might not work if it is scripted but it does work
# if you use Settings > Keyboard > Shortcuts to configure the shortcut.

gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom1/ name "Run or raise Spotify"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom1/ command "run-or-raise Spotify spotify"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom1/ binding "['<Primary><Super>s']"

# Terminal

# Run or raise terminal using Ctrl+Super+t
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom2/ name "Run or raise Terminal"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom2/ command "run-or-raise Gnome-Terminal gnome-terminal"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom2/ binding "['<Primary><Super>t']"

# Launch new terminal using Shift+Super+t
gsettings set org.cinnamon.desktop.keybindings.media-keys terminal "['<Shift><Super>t']"

# Emacs

# Run or raise Emacs using Ctrl+Super+e
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom3/ name "Run or raise Emacs"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom3/ command "/home/henrik/bin/rr/emacs-run-or-raise.sh"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom3/ binding "['<Primary><Super>e']"

# Chrome

# Run or raise Google Chrome using Ctrl+Super+c
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom4/ name "Run or raise Google Chrome"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom4/ command "run-or-raise Google-Chrome google-chrome"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom4/ binding "['<Primary><Super>c']"

# Launch Google Chrome using Shift+Super+c
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom5/ name "Launch Google Chrome"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom5/ command "google-chrome"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom5/ binding "['<Shift><Super>c']"

#
# Input sources
#

# English and Swedish input sources.
gsettings set org.gnome.libgnomekbd.keyboard layouts "['us', 'se']"

#
# Keyboard
#
echo Configuring keyboard

# Map Caps to Control. Switch input sources using Super+Space
gsettings set org.gnome.libgnomekbd.keyboard options \
	  "['ctrl\tctrl:nocaps', 'grp\tgrp:win_space_toggle']"

# Set keyboard repeat delay
gsettings set org.cinnamon.settings-daemon.peripherals.keyboard delay 550

# Set keyboard repeat interval
gsettings set org.cinnamon.settings-daemon.peripherals.keyboard repeat-interval 25

#
# Panel
#

echo Configuring panel

# Move the panel to the top of the screen.
gsettings set org.cinnamon panels-enabled "['1:0:top']"
