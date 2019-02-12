#!/bin/bash

# Exit this script if there are any errors.
set -e

# Exit script if it tries to use an uninitialized variable.
set -u

# Install packages.
echo Updating apt
apt-get --yes update

echo Upgrading system
apt-get --yes upgrade

echo Installing packages

# Install english language pack
apt-get --yes install language-pack-en

# Install git
apt-get --yes install git

# Install GnuPG
apt-get --yes install gnupg

# Install password utilities
apt-get --yes install pass pwgen

# Install Emacs
if [ -v DISPLAY ]; then
    apt --yes install emacs
else
    apt --yes install emacs-nox
fi

# Install Vim
apt-get --yes install vim

# Install Shells
apt-get --yes install fish

# Stop the /bin/open command from shadowing the fish open command.
if [ -f /bin/open ]; then
    mv /bin/open /bin/oldkbdopen
fi

# Install bash completion
# This might already be installed...
apt-get --yes install bash-completion

# Install cli trash command
apt-get --yes install trash-cli

# Install ubuntu make
apt-get --yes install ubuntu-make

# Install zip
apt-get --yes install zip unzip

# Install node and npm
# The node ecosystem expects the node executable to be called node.
# Therefore create a symlink to the correct name.
apt-get --yes install nodejs npm

# Install texlive
# For some reason xzdec is needed to get tlmgr to work
apt-get --yes install texlive-full xzdec

# Install http cli clients
apt-get --yes install curl wget httpie aria2

# Install ag
apt-get --yes install silversearcher-ag

# Install tmux
apt-get --yes install tmux

# Install network tools
apt-get --yes install whois

# Install mosh
apt-get --yes install mosh

# Install pandoc
apt-get --yes install pandoc

# Install aws cli command
apt-get --yes install awscli

# Install GCC and make among other things
apt-get --yes install build-essential

## Install LLVM and CLang
apt-get --yes install llvm clang

# Install gdb
apt-get --yes install gdb

# Install docker
apt-get --yes install docker.io

# Install packer
apt-get --yes install packer

# Install Java8 SDK
apt-get --yes install default-jdk

# Set the JAVA_HOME environment variable. You need to log out and
# then log back in again for the /etc/environment file to be reloaded.
JAVA_HOME="$(dirname $(dirname $(readlink -e $(which javac))))"
printf "JAVA_HOME=$JAVA_HOME\n" >> /etc/environment

# Install Steel Bank Common Lisp
apt-get --yes install sbcl sbcl-doc sbcl-source

# Install Gambit Scheme
apt-get --yes install gambc

# Install MIT Scheme
apt-get --yes install mit-scheme

# Install Racket
apt-get --yes install racket

# Install Go
apt-get --yes install golang-go

# Install Python
apt-get --yes install python-pip python3-pip python3-dev python3-setuptools python3-wheel

# Install Ruby
apt-get --yes install ruby

# Install Rust
apt-get --yes install rustc
apt-get --yes install cargo

# Install Lua
apt-get --yes install lua5.3
ln -s /usr/bin/lua5.3 /usr/bin/lua
apt-get --yes install liblua5.3-dev

# Install LuaRocks


# Install Löve2D
add-apt-repository --yes ppa:bartbes/love-stable
apt-get --yes update
apt-get install love

# Install weechat
apt-get --yes install weechat

# Install nginx
apt-get install -y nginx

# Install direnv
apt-get install -y direnv

# Install markdown
apt-get install -y markdown

# Install lnav
apt-get install -y lnav

# Install ranger
apt-get install -y ranger

# Install yank
apt-get install -y yank

# Install fzy
apt-get install -y fzy

# Install pick
apt-get install -y pick

#
# Email
#

# Install msmtp smtp client
apt-get install -y msmtp

# Install isync package which contains mbsync.
apt-get install -y isync

#
# Fonts
#

# Install Fira Code fonts
apt-get install -y fonts-firacode

# Install DejaVu fonts
apt-get install -y fonts-dejavu

# Install Liberation fonts
apt-get install -y fonts-liberation

# Install Inconsolata font
apt-get install -y fonts-inconsolata

# Install powerline fonts
# This package provides the fonts used by powerline. This package
# also contains the fontconfig settings that make these symbols
# available as part of other installed fonts.
# In other words the fonts-powerline only modifies existing fonts.
# It does not install complete new font families.
apt-get install -y fonts-powerline

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

# Remove packages that are no longer needed
apt-get --yes autoremove

# Enable unattended security updates
# See https://help.ubuntu.com/lts/serverguide/automatic-updates.html.en
# To configure unattended upgrades of all packages see the above link.
apt-get --yes install  unattended-upgrades

echo Finished installing packages
echo The installation script ran successfully.
