#!/bin/bash

# Exit this script if there are any errors.
set -e

# Exit script if it tries to use an uninitialized variable.
set -u

# First we need to upgrade the pacman database.
# See man pacman for more info on this.
pacman --noconfirm -Syu

# Install git
pacman --needed --noconfirm -S git

# Install gnupg
pacman --needed --noconfirm -S gnupg

# Install pass
pacman --needed --noconfirm -S pass pwgen

# Install Emacs
if [ -v DISPLAY ]; then
    pacman --needed --noconfirm -S emacs
else
    pacman --needed --noconfirm -S emacs-nox
fi

# Install Vim
# We use the gvim package instead of the vim package because we want
# clipboard support.
pacman --needed --noconfirm -S gvim

# Install fish
pacman --needed --noconfirm -S fish

# Bash completion should go here...
# Not sure how this is handled in Arch.

# Install cli trash command
pacman --needed --noconfirm -S trash-cli

# Install zip and unzip
pacman --needed --noconfirm -S zip unzip

# Install node
pacman --needed --noconfirm -S nodejs

# Install TeX
pacman --needed --noconfirm -S texlive-most

# Install curl and wget
pacman --needed --noconfirm -S curl wget

# Install httpie
pacman --needed --noconfirm -S httpie

# Install ag
pacman --needed --noconfirm -S the_silver_searcher

# Install ripgrep
pacman --needed --noconfirm -S ripgrep

# Install tmux
pacman --needed --noconfirm -S tmux

# Install whois
pacman --needed --noconfirm -S whois

# Install mosh
pacman --needed --noconfirm -S mosh

# Install pandoc
pacman --needed --noconfirm -S pandoc

# Install awscli
pacman --needed --noconfirm -S aws-cli

# Install build essentials
pacman --needed --noconfirm -S base-devel

# Install LLVM and clang
pacman --needed --noconfirm -S llvm clang

# Install gdb
pacman --needed --noconfirm -S gdb

# Install docker
pacman --needed --noconfirm -S docker

# Install Java
pacman --needed --noconfirm -S jdk10-openjdk openjdk10-doc

# Set the JAVA_HOME environment variable. You need to log out and
# then log back in again for the /etc/environment file to be reloaded.
JAVA_HOME="$(dirname $(dirname $(readlink -e $(which javac))))"
printf "JAVA_HOME=$JAVA_HOME\n" >> /etc/environment

# Install Steel Bank Common Lisp
pacman --needed --noconfirm -S sbcl

# Install Gambit Scheme
pacman --needed --noconfirm -S gambit-c

# Install Racket
pacman --needed --noconfirm -S racket racket-docs

# Install mit-scheme
pacman --needed --noconfirm -S mit-scheme

# Install Gambit Scheme
pacman --needed --noconfirm -S gambit-c

# Install Go
pacman --needed --noconfirm -S go

# Install Python 3
pacman --needed --noconfirm -S python python-pip python-setuptools python-wheel

# Install Ruby
pacman --needed --noconfirm -S ruby

# Install Rust
pacman --needed --noconfirm -S rust rust-docs

# Install weechat
pacman --needed --noconfirm -S weechat

# Install nginx
pacman --needed --noconfirm -S nginx

# Install direnv
# For some reason it is not possible to install direnv using pacman. The package
# is not found.
# pacman --noconfirm -S direnv

# Install markdown
pacman --needed --noconfirm -S markdown

# Install fzy
pacman --needed --noconfirm -S fzy

# Install fd
pacman --needed --noconfirm -S fd

# Install pick

#
# Email
#

# Install msmtp
pacman --needed --noconfirm -S msmtp

# Install isync package which contains mbsync.
pacman --needed --noconfirm -S isync

#
# Fonts
#

# Install Fira Code font
# This did not work.
# pacman --noconfirm -S otf-fira-code ttf-fira-code

# Install dejavu font
pacman --needed --noconfirm -S ttf-dejavu

# Install Liberation font
pacman --needed --noconfirm -S ttf-liberation

# Install Inconsolata font
pacman --needed --noconfirm -S ttf-inconsolata

# Install Adobe Source Code Pro font
pacman --needed --noconfirm -S adobe-source-code-pro-fonts

# Install Powerline fonts
# This package patches existing fonts on the system with the special symbols
# that are needed by powerline.
# In other words this package only modifies existing fonts.
# It does not install any new complete fonts.
pacman --needed --noconfirm -S powerline-fonts

#
# Window Managers
#

# Install lumina desktop
# This works on Manjaro
pacman --needed --noconfirm -S lumina-desktop

# Install snap
pacman --needed --noconfirm -S snapd
systemctl enable --now snapd.socket

# Install playerctl
pacman --needed --noconfirm -S playerctl

#
# AUR packages
#

# You are not allowed to run makepkg as root. Therefore packages
# that need to be installed from AUR should not be installed in
# this script.

echo Finished installing packages
echo The installation script ran successfully
