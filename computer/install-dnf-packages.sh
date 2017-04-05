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

