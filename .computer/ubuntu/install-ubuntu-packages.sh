#!/bin/bash

# Exit this script if there are any errors.
set -e

# Exit script if it tries to use an uninitialized variable.
set -u

# Install packages.
echo Updating apt
apt --yes update

echo Upgrading system
apt --yes upgrade

echo Installing packages

# Install english language pack
apt --yes install language-pack-en

# Install git
apt --yes install git

# Install password utilities
apt --yes install pass pwgen

# Install Emacs
if [ -v DISPLAY ]; then
    apt --yes install emacs
else
    apt --yes install emacs-nox
fi

# Install Vim
apt --yes install vim

# Install Shells
apt --yes install fish

# Install bash completion
# This might already be installed...
apt --yes install bash-completion

# Install cli trash command
apt --yes install trash-cli

# Install ubuntu make
apt --yes install ubuntu-make

# Install zip
apt --yes install zip unzip

# Install node and npm
# The node ecosystem expects the node executable to be called node.
# Therefore create a symlink to the correct name.
apt --yes install nodejs npm
ln -s /usr/bin/nodejs /usr/local/bin/node

# Install texlive
# For some reason xzdec is needed to get tlmgr to work
apt --yes install texlive-full xzdec

# Install http cli clients
apt --yes install curl wget httpie aria2

# Install ag
apt --yes install silversearcher-ag

# Install tmux
apt --yes install tmux

# Install network tools
apt --yes install whois

# Install mosh
apt --yes install mosh

# Install pandoc
apt --yes install pandoc

# Install aws cli command
apt --yes install awscli

# Install GCC and make among other things
apt --yes install build-essential

## Install LLVM and CLang
apt --yes install llvm clang

# Install gdb
apt --yes install gdb

# Install docker
apt --yes install docker.io

# Install Java8 SDK
apt --yes install default-jdk

# Set the JAVA_HOME environment variable. You need to log out and
# then log back in again for the /etc/environment file to be reloaded.
JAVA_HOME="$(dirname $(dirname $(readlink -e $(which javac))))"
printf "JAVA_HOME=$JAVA_HOME\n" >> /etc/environment

# Install Steel Bank Common Lisp
apt --yes install sbcl sbcl-doc sbcl-source

# Install Gambit Scheme
apt --yes install gambc

# Install MIT Scheme
apt --yes install mit-scheme

# Install Go
apt --yes install golang-go

# Install Python
apt --yes install python-pip python3-pip python3-dev python3-setuptools python3-wheel

# Install Ruby
apt --yes install ruby

# Install weechat
apt --yes install weechat

# Install nginx
apt install -y nginx

# Install direnv
apt install -y direnv

# Install markdown
apt install -y markdown

# Install lnav
apt install -y lnav

# Install ranger
apt install -y ranger

# Install yank
apt install -y yank

#
# Email
#

# Install msmtp smtp client
apt install -y msmtp

# Install isync package which contains mbsync.
apt install -y isync

#
# Fonts
#

# Install Fira Code fonts
apt install -y fonts-firacode

# Install DejaVu fonts
apt install -y fonts-dejavu

# Install Liberation fonts
apt install -y fonts-liberation

# Install Inconsolata font
apt install -y fonts-inconsolata

# Install powerline fonts
# This package provides the fonts used by powerline. This package
# also contains the fontconfig settings that make these symbols
# available as part of other installed fonts.
# In other words the fonts-powerline only modifies existing fonts.
# It does not install complete new font families.
apt install -y fonts-powerline

#
# Window Managers
#

# Install OpenBox
apt install -y openbox

# Install wmctrl. This is needed for my run-and-raise script.
apt install -y wmctrl

# Install xdotool
apt install -y xdotool

# I use feh to display a backround image under X.
apt install -y feh

# Install light-locker
apt install -y light-locker

# Install arandr
apt install -y arandr

# Volume control applet
apt install -y pasystray

# Panel
apt install -y tint2

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

#
# The python-dbus is required by the spotify cli
#
# apt install -y python-dbus

# Remove packages that are no longer needed
apt --yes autoremove

echo Finished installing packages
echo The installation script ran successfully.
