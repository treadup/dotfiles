#!/bin/bash

# To use this script you have to have at least the XCode command line tools installed.
# The following command will install XCode command line tools if they are not already
# installed.
xcode-select --install

# In Mojave the system headers are no longer installed to /usr/include
# To install the headers to /usr/include you need to execute the following command.
# https://developer.apple.com/documentation/xcode_release_notes/xcode_10_release_notes#3035624
installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

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
brew install watch

# Install Iterm2
brew cask install iterm2

# Install shells
brew install fish
brew install tcsh

# Install bash completion
brew install bash-completion

# Install Spectacle
brew cask install spectacle

# Install cliclick
brew install cliclick

# Install editors
brew cask install emacs
brew install vim
brew install neovim

# Install Sublime Text
brew cask install sublime-text
SUBLIME_PACKAGE_DIR="$HOME/Library/Application Support/Sublime Text 3/Installed Packages"
SUBLIME_USER_DIR="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
mkdir -p "$SUBLIME_PACKAGE_DIR"
mkdir -p "$SUBLIME_USER_DIR"

curl -o "$SUBLIME_PACKAGE_DIR/Package Control.sublime-package" https://packagecontrol.io/Package%20Control.sublime-package

# Install direnv
brew install direnv

# Install Firefox
brew cask install firefox

# Install terminal multiplexers
brew install tmux
brew install screen

# Install telnet
brew install telnet

# Install Python
brew install python
brew install python3
brew install pyenv
brew install pyenv-virtualenv

# Install Kivy dependencies
brew install pkg-config sdl2 sdl2_image sdl2_ttf sdl2_mixer gstreamer

# Install Java
brew cask install adoptopenjdk

# Install Ruby
brew install ruby

# Install Steel Bank Common Lisp
brew install sbcl

# Install Lua
brew install lua
brew install luarocks
brew cask install love

# Install Golang
brew install go
brew install dep

# Install Node
brew install node
brew install jq
brew install jo
brew install gron

# Install Clojure
brew install clojure
brew install leiningen
brew install boot-clj

# Install Racket
brew cask install racket

# Install Erlang
brew install erlang
brew install rebar3

# Install web server
brew install nginx

# Install Traefik
brew install traefik

# Install Heroku CLI
brew tap heroku/brew
brew install heroku

# Install awscli
brew install awscli

# Install TeX
brew cask install basictex
# brew cask install mactex

# Install PostgreSQL
brew install postgresql

# Install MariaDB
brew install mariadb

# Install RabbitMQ
brew install rabbitmq

# Install VirtualBox
brew cask install virtualbox

# Install Charles Web Proxy
brew cask install charles

# Install Insomnia rest client
brew cask install insomnia

# Install Postman rest client
brew cask install postman

# Install CoronaSDK
# Not sure that I like the licensing of the CoronaSDK product
# brew cask install coronasdk

# Install Docker
# Install docker from the website. Otherwise things like docker-compose
# will not be setup correctly.
# brew install docker
# brew cask install docker

# Install Packer
brew install packer

# Install Ansible
brew install ansible

# Install Kubernetes CLI
brew install kubernetes-cli

# Install minikube
brew cask install minikube

# Install multimarkdown
brew install multimarkdown

# Install highlight
brew install highlight

# Install utilities
brew install tree
brew install wget
brew install the_silver_searcher
brew install ripgrep
brew install tldr
brew install ispell
bres install dict
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

# Install Karabiner Elements
brew cask install karabiner-elements

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

# Install ImageMagick
brew install imagemagick

# Install kap screen recorder
brew cask install kap

# Install Aerial screen saver
brew cask install aerial

# Install ngrok local port forwarding tool
brew cask install ngrok
