#!/bin/bash

# To use this script you have to have at least the XCode command line tools installed.
# The following command will install XCode command line tools if they are not already
# installed.
xcode-select --install

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update homebrew
brew update

# Install core stuff
brew install pass
brew install git
brew install pwgen
brew install gnupg2

# Install editors
brew install emacs
brew install vim

# Install Cask
brew tap caskroom/cask

# Install utilities
brew install tree
brew install wget
brew install the_silver_searcher
brew install tldr
brew install ispell

# Network stuff
brew install screen

# Install programming languages
brew install python
brew install python3
brew cask install java
brew install node
brew install go
brew install ruby

# Install web server
brew install nginx

# Install hosting utils
brew install heroku
brew install awscli
