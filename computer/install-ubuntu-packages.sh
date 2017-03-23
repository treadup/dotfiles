#!/bin/bash

# Install packages.
apt-get --force-yes --yes update
apt-get --force-yes --yes upgrade

# Install english language pack
apt-get --force-yes --yes install language-pack-en

# Install git
apt-get --force-yes --yes install git

# Install password utilities
apt-get --force-yes --yes install pass pwgen

# Install editors
apt-get --force-yes --yes install emacs24-nox vim

# Install cli trash command
apt-get --force-yes --yes install trash-cli

# Install zip
apt-get --force-yes --yes install zip unzip

# Install node and npm
apt-get --force-yes --yes install nodejs npm

# Install texlive
# For some reason xzdec is needed to get tlmgr to work
apt-get --force-yes --yes install texlive-full xzdec

# Install http cli clients
apt-get --force-yes --yes install curl wget httpie

# Install ag
apt-get --force-yes --yes install silversearcher-ag

# Install screen
apt-get --force-yes --yes install screen

# Install Python related things
apt-get --force-yes --yes install python3-pip virtualenv python3-dev

# Install network tools
apt-get --force-yes --yes install whois

# Install pandoc
apt-get --force-yes --yes install pandoc

# Install heroku
apt-get --force-yes --yes install heroku

# Install certbot
apt-get --force-yes --yes install certbot

# Install aws cli command
apt-get --force-yes --yes install awscli

# Install GCC and make among other things
apt-get --force-yes --yes install build-essential

## Install LLVM and CLang
apt-get --force-yes --yes install llvm clang

# Install docker
apt-get --force-yes --yes install docker.io

# Install Java8 SDK
apt-get --force-yes --yes install default-jdk

# Install Steel Bank Common Lisp
apt-get --force-yes --yes install sbcl

# Install Gambit Scheme
apt-get --force-yes --yes install gambc

# Install MIT Scheme
apt-get --force-yes --yes install mit-scheme

# Install Go
apt-get --force-yes --yes install golang

# Install Guile Scheme
apt-get --force-yes --yes install guile-2.0

# Install weechat
apt-get --force-yes --yes install weechat

# Remove packages that are no longer needed
apt-get --force-yes --yes autoremove
