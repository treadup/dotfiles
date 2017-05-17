#!/bin/bash

# Install packages.
apt-get --yes update
apt-get --yes upgrade

# Install english language pack
apt-get --yes install language-pack-en

# Install git
apt-get --yes install git

# Install password utilities
apt-get --yes install pass pwgen

# Install Emacs
if [ -z $DISPLAY ]; then
    apt-get --yes install emacs-nox
else
    apt-get --yes install emacs
fi

# Install Vim
apt-get --yes install vim

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
ln -s /usr/bin/nodejs /usr/local/bin/node

# Install texlive
# For some reason xzdec is needed to get tlmgr to work
apt-get --yes install texlive-full xzdec

# Install http cli clients
apt-get --yes install curl wget httpie

# Install ag
apt-get --yes install silversearcher-ag

# Install screen
apt-get --yes install screen

# Install Python related things
apt-get --yes install python3-pip virtualenv python3-dev

# Install network tools
apt-get --yes install whois

# Install pandoc
apt-get --yes install pandoc

# Install heroku
apt-get --yes install heroku

# Install certbot
apt-get --yes install certbot

# Install aws cli command
apt-get --yes install awscli

# Install GCC and make among other things
apt-get --yes install build-essential

## Install LLVM and CLang
apt-get --yes install llvm clang

# Install docker
apt-get --yes install docker.io

# Install Java8 SDK
apt-get --yes install default-jdk

# Set the JAVA_HOME environment variable. You need to log out and
# then log back in again for the /etc/environment file to be reloaded.
JAVA_HOME="$(dirname $(dirname $(readlink -e $(which javac))))"
printf "JAVA_HOME=$JAVA_HOME\n" >> /etc/environment 

# Install Steel Bank Common Lisp
apt-get --yes install sbcl

# Install Gambit Scheme
apt-get --yes install gambc

# Install MIT Scheme
apt-get --yes install mit-scheme

# Install Go
apt-get --yes install golang

# Install Guile Scheme
apt-get --yes install guile-2.0

# Install weechat
apt-get --yes install weechat

# Install nginx
apt install -y nginx

# Remove packages that are no longer needed
apt-get --yes autoremove
