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

# Install Iterm2
brew cask install iterm2

# Install shells
brew install fish
brew install tcsh

# Install bash completion
brew install bash-completion

# Install Spectacle
brew cask install spectacle

# Install editors
brew cask install emacs
brew install vim
# brew cask install atom
# brew cask install sublime-text

# Install direnv
brew install direnv

# Install Firefox
brew cask install firefox

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
brew install sbcl

# Install web server
brew install nginx

# Install hosting utils
brew install heroku
brew install awscli

# Install TeX
brew cask install basictex
# brew cask install mactex

# Install PostgreSQL
brew install postgresql

# Install RabbitMQ
brew install rabbitmq

# Install VirtualBox
brew cask install virtualbox

# Install hyper.sh client
brew install hyper

# Install Charles Web Proxy
brew cask install charles

# Install Docker
# Install docker from the website. Otherwise things like docker-compose
# will not be setup correctly.
# brew install docker
# brew cask install docker

# Install multimarkdown
brew install multimarkdown

# Install utilities
brew install tree
brew install wget
brew install the_silver_searcher
brew install ripgrep
brew install tldr
brew install ispell
brew install fd
brew install fzf
brew install fzy
brew install yank
brew install fd
brew install pick
brew install trash
brew install htop
brew install glances

# Install fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro
brew cask install font-firacode-nerd-font

# Install Hammerspoon
brew cask install hammerspoon

# Install lnav
brew install lnav

# Install ranger
brew install ranger

# Install mosh
brew install mosh

# Install Redis
brew install redis

# Install memcached
brew install memcached
