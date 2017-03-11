#!/bin/bash

if [-f ~/.already_configured]; then
    exit 0
fi

touch ~/.already_configured

# TODO: Make this section check if we are on Linux or Mac and
# install the packages with apt or brew as appropriate.

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

# Install docker
apt-get --force-yes --yes install docker.io

# Install Java8 SDK
apt-get --force-yes --yes install default-jdk

# Install Steel Bank Common Lisp
apt-get --force-yes --yes install sbcl

# Install Gambit Scheme
apt-get --force-yes --yes install gambc

# Install Go
apt-get --force-yes --yes install golang

# Remove pacakges that are no longer needed
apt-get --force-yes --yes autoremove

# Setup the dot files from git repo
# The following is to get around the fact that we cannot clone into a non empty directory.
git init
git remote add origin git@github.com:treadup/DotFiles.git
git fetch origin
git checkout -b master --force --track origin/master

# Download .emacs.d repo
git clone git@github.com:treadup/.emacs.d.git

# Install the moderncv latex package
tlmgr -v init-usertree
tlmgr install moderncv

# Create the bin folder.
mkdir -p ~/bin

# Install Clojure
curl -o ~/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod 755 ~/bin/lein
~/bin/lein

# Setup the password store
echo Remember that you now have to setup gpg and pass
echo To set up pass remember to use pass git init instead of pass init
