#!/bin/bash

# This file contains settings for Gnome. It is intended that you run this file once
# and it will configure Gnome for you.

# The way I find the settings to use in this file is to use the command dconf watch / which
# will watch for changes in the root schema. Then I use Settings or Gnome Tweak Tool to make
# changes and look at the output from dconf watch /.

# Set the theme
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
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Primary><Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Primary><Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Primary><Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Primary><Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Primary><Super>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Primary><Super>6']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 "['<Primary><Super>7']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 "['<Primary><Super>8']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 "['<Primary><Super>9']"

# Move window to workspace using Shift+Super+1, ..., Shift+Super+9
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Primary><Super>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Primary><Super>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Primary><Super>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Primary><Super>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Shift><Primary><Super>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Shift><Primary><Super>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Shift><Primary><Super>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Shift><Primary><Super>6']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 "['<Shift><Primary><Super>7']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 "['<Shift><Primary><Super>8']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 "['<Shift><Primary><Super>9']"

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

# Disable the hot corner
gsettings set org.gnome.shell enable-hot-corners false

# Show percentage of battery left.
gsettings set org.gnome.desktop.interface show-battery-percentage true

#
# Dock
#

# Show the following applications in the dock.
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'google-chrome.desktop', 'emacs25.desktop', 'org.gnome.Terminal.desktop','spotify.desktop', 'shotwell.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop']"

# Make the dock take the full height of the screen
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height true

# Do not use the hotkeys Super+1, ..., Super+9 to launch applications in the dock.
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys true

# Each workspace has its own isolated dock.
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true

# Raise the application window when clicking on the icon of a running application.
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'skip'

# Launch a new instance of the application when shift clicking the application
gsettings set org.gnome.shell.extensions.dash-to-dock shift-click-action 'launch'

# Do not show animations when the user presses the show applications button
gsettings set org.gnome.shell.extensions.dash-to-dock animate-show-apps false

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

echo You might have to restart Gnome for all the Gnome Shell Extensions to show up.
echo Or you can restart Gnome Shell using the following command: gnome-shell --replace
