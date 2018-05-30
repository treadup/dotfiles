#!/bin/bash

# This script installs a collection of my favorite packages
# on a linux machine that uses dnf as its package manager.

# We need to upgrade the existing packages.
# This solves a weird problem with not being able to install Vim.
dnf -y upgrade

# Install password utilities
dnf -y install pass pwgen

# Install emacs
dnf -y install emacs

# Install vim
dnf -y install vim

# Install node and npm
dnf -y install node npm

# Install texlive
dnf -y install texlive-scheme-full

# Install ag
dnf -y install the_silver_searcher

# Install screen
dnf -y install screen

# Install build essentials equivalent
dnf -y install make automake gcc kernel-devel

# Install LLVM and CLang
dnf -y install llvm clang

# Install docker
dnf -y install docker

# Install Java/OpenJDK
dnf -y install java-devel

# Not sure if I need to set JAVA_HOME or not.

# Install Steel Bank Common Lisp
dnf -y install sbcl

# Install Guile scheme
dnf -y install guile

# Install Go
dnf -y install golang

# Install weechat
dnf -y install weechat

# Use the RPM fusion repo
dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install freeworld freetype fonts. This is needed to fix the horrible fonts in Fedora.
# The patent for this should expire in 2019 and things might be better then.
dnf -y install freetype-freeworld

# Install VLC media player
dnf -y install vlc

# Install VLC based browser video plugin
dnf -y install npapi-vlc-gtk

# Install Fluxbox window manager
dnf -y install fluxbox fbdesk fluxconf alltray

