#!/bin/bash

# Install packages.
apt --yes update
apt --yes upgrade

# Install english language pack
apt --yes install language-pack-en

# Install git
apt --yes install git

# Install password utilities
apt --yes install pass pwgen

# Install Emacs
if [ -z $DISPLAY ]; then
    apt --yes install emacs-nox
else
    apt --yes install emacs
fi

# Install Vim
apt --yes install vim

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
apt --yes install curl wget httpie

# Install ag
apt --yes install silversearcher-ag

# Install screen
apt --yes install screen

# Install Python related things
apt --yes install python3-pip python3-dev

# Install network tools
apt --yes install whois

# Install pandoc
apt --yes install pandoc

# Install heroku
## Add repo for heroku cli program
add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -
apt update 
apt --yes install heroku

# Install certbot
apt --yes install certbot

# Install aws cli command
apt --yes install awscli

# Install GCC and make among other things
apt --yes install build-essential

## Install LLVM and CLang
apt --yes install llvm clang

# Install docker
apt --yes install docker.io

# Install Java8 SDK
apt --yes install default-jdk

# Set the JAVA_HOME environment variable. You need to log out and
# then log back in again for the /etc/environment file to be reloaded.
JAVA_HOME="$(dirname $(dirname $(readlink -e $(which javac))))"
printf "JAVA_HOME=$JAVA_HOME\n" >> /etc/environment 

# Install Steel Bank Common Lisp
apt --yes install sbcl

# Install Gambit Scheme
apt --yes install gambc

# Install MIT Scheme
apt --yes install mit-scheme

# Install Go
apt --yes install golang

# Install Guile Scheme
apt --yes install guile-2.0

# Install weechat
apt --yes install weechat

# Install nginx
apt install -y nginx

# Install alpine email client
apt install -y alpine

# Install msmtp smtp client
apt install msmtp

# Remove packages that are no longer needed
apt --yes autoremove
