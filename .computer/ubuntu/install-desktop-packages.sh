#!/bin/bash

# Exit this script if there are any errors.
set -e

# Exit script if it tries to use an uninitialized variable.
set -u

echo Updating apt
apt-get --yes update

echo Installing desktop packages

#
# Kivy
#
add-apt-repository --yes ppa:kivy-team/kivy
apt-get --yes update
apt-get install --yes python3-kivy

#
# Gnome
#

# To install vanilla Gnome use the following command.
# apt install -y gnome gnome-shell

# Install Gnome tweak tool
apt-get install -y gnome-tweak-tool

# Install lots of Gnome Shell Extensions
# Some of the Gnome Shell Extensions are available as individual
# Ubuntu packages. So you might want to look at these as well.
apt-get install -y gnome-shell-extensions
apt-get install -y gnome-shell-extension-dashtodock
apt-get install -y gnome-shell-extension-ubuntu-dock
apt-get install -y gnome-shell-extension-caffeine
apt-get install -y gnome-shell-extension-move-clock

#
# Install flatpak
#
# apt install --yes flatpak

# Snap is already available in Ubuntu without having to install anything.
# Just use the command snap from the cli.

# Install Spotify
snap install spotify --classic

# Install Slack
snap install slack --classic

# Install ripgrep
snap install rg

#
# The python-dbus is required by the spotify cli
#
# apt install -y python-dbus

#
# Google Chrome
#

# Download and install the key associated with the Google Chrome repository.
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Add the Google Chrome repo to the sources list.
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

# Update the repository since we added a new source.
apt-get update

# Install Google Chrome
apt-get --yes install google-chrome-stable
