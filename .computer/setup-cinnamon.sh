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
