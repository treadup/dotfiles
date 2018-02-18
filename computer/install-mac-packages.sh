#!/bin/bash

# To use this script you have to have at least the XCode command line tools installed.
# The following command will install XCode command line tools if they are not already
# installed.
xcode-select --install

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update homebrew
brew update

# Install Cask
brew tap caskroom/cask

# Install GPG
brew install gnupg2
brew install pinentry-mac

# Install core stuff
brew install pass
brew install git
brew install pwgen
brew install coreutils

# Install yet another dotfiles manager
brew install yadm

# Install Iterm2
brew cask install iterm2

# Install shells
brew install fish
brew install tcsh

# Install bash completion
brew install bash-completion

# Install editors
brew cask install emacs
brew install vim
# brew cask install atom
# brew cask install sublime-text

# Install Firefox
brew cask install firefox

# Install utilities
brew install tree
brew install wget
brew install the_silver_searcher
brew install tldr
brew install ispell
brew install fd

# Install tmux
brew install tmux

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

# Install TeX
brew cask install basictex

# Install PostgreSQL
brew install postgresql

# Install RabbitMQ
brew install rabbitmq

# Install VirtualBox
brew cask install virtualbox

# Install Docker
brew cask install docker

# Install fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro
brew cask install font-firacode-nerd-font
