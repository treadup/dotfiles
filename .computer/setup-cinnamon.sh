#!/bin/bash

# Cinnamon is configured using the System Settings application.
# To see the changes that are being made you can use the command
# dconf watch /

# Cinnamon stores its configuration settings in the org.cinnamon
# schema.

#
# System
#
echo Configuring system

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

# The contents of the main panel is stored in the org.cinnamon.enabled-applets variable.

# The format is an array of items [item1, ..., itemN]

# The format of each item is a single quoted string that contains colon separated fields.
# <panel name>:<position>:<order>:<applet id>:<sequence number>
#
# <panel name>: There is only one panel and it is called panel1
# <position>: The position can be one of left, center or right
# <order>: For each position the applets are sorted by the order number in ascending order.
# <applet id>: This is the name of the applet
# <sequence>: It is a bit unclear what this is but it seems to be a monotonically increasing
#             sequence number.

ENABLED_APPLETS="[\
'panel1:right:7:systray@cinnamon.org:0', \
'panel1:left:0:menu@cinnamon.org:1', \
'panel1:left:2:show-desktop@cinnamon.org:2', \
'panel1:left:4:panel-launchers@cinnamon.org:3', \
'panel1:right:8:keyboard@cinnamon.org:5', \
'panel1:right:9:notifications@cinnamon.org:6', \
'panel1:right:10:removable-drives@cinnamon.org:7', \
'panel1:right:11:user@cinnamon.org:8', \
'panel1:right:12:network@cinnamon.org:9', \
'panel1:right:14:power@cinnamon.org:11', \
'panel1:right:15:calendar@cinnamon.org:12', \
'panel1:right:16:sound@cinnamon.org:13', \
'panel1:right:6:xrandr@cinnamon.org:14', \
'panel1:center:0:window-list@cinnamon.org:20' \
]"

gsettings set org.cinnamon enabled-applets "$ENABLED_APPLETS"
