#!/bin/bash

# Exit this script if there are any errors.
set -e

# Exit script if it tries to use an uninitialized variable.
set -u

# First we need to upgrade the pacman database.
# See man pacman for more info on this.
pacman --noconfirm -Syu

# Install git
pacman --noconfirm -S git

# Install pass
pacman --noconfirm -S pass pwgen

# Install Emacs
if [ -v DISPLAY ]; then
    pacman --noconfirm -S emacs
else
    pacman --noconfirm -S emacs-nox
fi

# Install Vim
# We use the gvim package instead of the vim package because we want
# clipboard support.
pacman --noconfirm -S gvim

# Install fish
pacman --noconfirm -S fish

# Bash completion should go here...
# Not sure how this is handled in Arch.

# Install zip and unzip
pacman --noconfirm -S zip unzip

# Install node
pacman --noconfirm -S nodejs

# Install TeX
# Do this later since this will take a lot of time.

# Install curl and wget
pacman --noconfirm -S curl wget

# Install httpie
pacman --noconfirm -S httpie

# Install ag
pacman --noconfirm -S the_silver_searcher

# Install whois
pacman --noconfirm -S whois

# Install mosh
pacman --noconfirm -S mosh

# Install pandoc
pacman --noconfirm -S pandoc

# Install awscli
pacman --noconfirm -S aws-cli

# Install build essentials
pacman --noconfirm -S base-devel

# Install LLVM and clang
pacman --noconfirm -S llvm clang

# Install gdb
pacman --noconfirm -S gdb

# Install docker
pacman --noconfirm -S docker

# Install Java
pacman --noconfirm -S jdk10-openjdk openjdk10-doc

# Set the JAVA_HOME environment variable. You need to log out and
# then log back in again for the /etc/environment file to be reloaded.
JAVA_HOME="$(dirname $(dirname $(readlink -e $(which javac))))"
printf "JAVA_HOME=$JAVA_HOME\n" >> /etc/environment

# Install Steel Bank Common Lisp
pacman --noconfirm -S sbcl

# Install Gambit Scheme
pacman --noconfirm -S gambit-c

# Install Racket
pacman --noconfirm -S racket racket-docs

# Install mit-scheme
pacman --noconfirm -S mit-scheme

# Install Go
pacman --noconfirm -S go

# Install Python 3
pacman --noconfirm -S python python-pip python-setuptools python-wheel

# Install Ruby
pacman --noconfirm -S ruby

# Install weechat
pacman --noconfirm -S weechat

# Install nginx
pacman --noconfirm -S nginx

# Install direnv
# For some reason it is not possible to install direnv using pacman. The package
# is not found.
# pacman --noconfirm -S direnv

# Install markdown
pacman --noconfirm -S markdown

#
# Email
#

# Install msmtp
pacman --noconfirm -S msmtp

# Install isync package which contains mbsync.
pacman --noconfirm -S isync

#
# Fonts
#

# Install Fira Code font
# This did not work.
# pacman --noconfirm -S otf-fira-code ttf-fira-code

# Install dejavu font
pacman --noconfirm -S ttf-dejavu

# Install Liberation font
pacman --noconfirm -S ttf-liberation

# Install Inconsolata font
pacman --noconfirm -S ttf-inconsolata

# Install Adobe Source Code Pro font
pacman --noconfirm -S adobe-source-code-pro-fonts

# Install Powerline fonts
# This package patches existing fonts on the system with the special symbols
# that are needed by powerline.
# In other words this package only modifies existing fonts.
# It does not install any new complete fonts.
pacman --noconfirm -S powerline-fonts

#
# Window Managers
#

# Install OpenBox
pacman --noconfirm -S openbox

# Install wmctrl and xdotool
pacman --noconfirm -S wmctrl xdotool

# Install feh which is used to display a background image under X.
pacman --noconfirm -S feh

# Install light-locker
pacman --noconfirm -S light-locker

# Install arandr
pacman --noconfirm -S arandr

# Install pasystray
# This did not work.
# pacman --noconfirm -S pasystray

# Install tint2
pacman --noconfirm -S tint2

# Install snap
pacman --noconfirm -S snapd
systemctl enable --now snapd.socket

echo Finished installing packages
echo The installation script ran successfully
