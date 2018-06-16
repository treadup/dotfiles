#!/bin/bash

# This file contains settings for Gnome. It is intended that you run this file once
# and it will configure Gnome for you.

gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# There is an issue with setting the backgound image from a script.
# Do this manually using the gnome-tweak-tool instead.

# Use keybindings from the Emacs editor.
gsettings set org.gnome.desktop.interface gtk-key-theme 'Emacs'

# Remap the CapsLock key to Ctrl.
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps', 'caps:ctrl_modifier']"

# Show minimize, maximize and close window buttons
# gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
gsettings set org.gnome.desktop.wm.preferences button-layout "'menu:minimize,maximize,close'"

# US and Swedish as input sources
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'se')]"

#
# Peripherals
#

# Set the keyboard speed
gsettings set org.gnome.desktop.peripherals.keyboard delay 170
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 25

# Set the mouse speed
gsettings set org.gnome.desktop.peripherals.mouse speed 0.0

#
# Workspaces
#

# Use static workspaces which means that the number of workspaces is fixed.
gsettings set org.gnome.shell.overrides dynamic-workspaces false

# Use 9 workspaces
gsettings set org.gnome.desktop.wm.preferences num-workspaces 9

# Switch to workspace using Super+1, ..., Super+9
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>6']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 "['<Super>7']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 "['<Super>8']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 "['<Super>9']"

# Move window to workspace using Shift+Super+1, ..., Shift+Super+9
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Super>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Super>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Super>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Super>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Shift><Super>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Shift><Super>6']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 "['<Shift><Super>7']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 "['<Shift><Super>8']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 "['<Shift><Super>9']"

# The workspace should span all displays
gsettings set org.gnome.shell.overrides workspaces-only-on-primary false

#
# Tiling
#

# Gnome 3 seems to have horrible support for the tiling operations.
# For example the following operations exist but are completely useless
# when you have a workspace that spans two displays.

# org.gnome.desktop.wm.keybindings move-to-corner-nw
# org.gnome.desktop.wm.keybindings move-to-corner-ne
# org.gnome.desktop.wm.keybindings move-to-corner-se
# org.gnome.desktop.wm.keybindings move-to-corner-sw

#
# Navigation
#

# Show the desktop
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"

#
# Keyboard shortcuts
#

# Use the right super key as the overlay key.
gsettings set org.gnome.mutter overlay-key 'Super_R'

# Use Super+t to launch the terminal
# I would like to use Super+t to run or raise the terminal and Super+T to launch a new terminal.
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal '<Super>t'

# Use Super+b to launch a web browser
gsettings set org.gnome.settings-daemon.plugins.media-keys www '<Super>b'

#
# Top bar
#

# Show percentage of battery left.
gsettings set org.gnome.desktop.interface show-battery-percentage true

#
# Extensions
#

# Note that when you use the gnome-shell-extension-tool you have to specify
# the full UUID of the extension. It is not enough to specify the part in
# front of the @ sign.

# Enable places menu
gnome-shell-extension-tool -e places-menu@gnome-shell-extensions.gcampax.github.com

# Enable workspace indicator
gnome-shell-extension-tool -e workspace-indicator@gnome-shell-extensions.gcampax.github.com

# Enable dash to dock
gnome-shell-extension-tool -e dash-to-dock@micxgx.gmail.com

# Enable caffeine
gnome-shell-extension-tool -e caffeine@patapon.info

# Enable move clock
gnome-shell-extension-tool -e Move_Clock@jonathan.bluemosh.com

# It should not be necessary to restart gnome-shell but if you have to you can use the
# following command.
#
gnome-shell --replace
