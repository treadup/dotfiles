#!/bin/bash

# Exit this script if there are any errors.
set -e

# Exit script if it tries to use an uninitialized variable.
set -u

# Make sure that we are in the home folder.
cd ~/

# To use this script you have to have at least the XCode command line tools installed.
# The following command will install XCode command line tools if they are not already
# installed.
echo Installing Xcode
xcode-select --install

# In Mojave the system headers are no longer installed to /usr/include
# To install the headers to /usr/include you need to execute the following command.
# https://developer.apple.com/documentation/xcode_release_notes/xcode_10_release_notes#3035624
installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

# Install Homebrew
echo Installing Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update homebrew
brew update

# Install Cask
brew tap caskroom/cask

export PATH=/usr/local/bin:$PATH

echo --------------------------------------------------------
echo Creating standard folders
echo --------------------------------------------------------
# Create the user bin, lib and include folders.
mkdir -p ~/bin
mkdir -p ~/lib
mkdir -p ~/include

export PATH=$HOME/bin:$PATH

# Create ~/code folder
mkdir -p code/lisp code/go code/clojure code/javascript code/python code/racket code/docker

echo --------------------------------------------------------
echo Installing packages
echo --------------------------------------------------------

# Install Git
brew install git
git config --global core.excludesfile ~/.gitignore_global

# Install GPG
brew install gnupg2
brew install pinentry-mac
ln -s $HOME/.gnupg/gpg-agent.conf.macos $HOME/.gnupg/gpg-agent.conf

# Install core stuff
brew install pass
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
# I use hammerspoon for this instead.
# brew cask install spectacle

# Install cliclick
brew install cliclick

#
# Editors
#

# Install editors
brew cask install emacs
brew install vim
brew install neovim
brew cask install visual-studio-code

# Install direnv
brew install direnv

# Install Firefox
brew cask install firefox

# Install terminal multiplexers
brew install tmux
brew install screen

# Install parallel ssh
brew install pssh

# Install telnet
brew install telnet

#
# Java
#

# Install Java
brew cask install adoptopenjdk
# brew cask install intellij-idea-ce
brew install maven
brew install gradle

#
# Ruby
#

# Install Ruby
brew install ruby


#
# Lua
#

# Install Lua
brew install lua
brew install luarocks
brew cask install love

#
# Clojure
#

# Install Clojure
brew install clojure
brew install leiningen

#
# Erlang
#

# Install Erlang
brew install erlang
brew install rebar3

#
# Rust
#

# Install Rust
brew install rustup
rustup-init -y --no-modify-path

# Install CMake
brew install cmake

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
brew install pgcli

# Install MariaDB
brew install mariadb
brew install mycli

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

# Install JetBrains Toolbox
brew cask install jetbrains-toolbox

# Install Docker
# Install docker from the website. Otherwise things like docker-compose
# will not be setup correctly.
# brew install docker
# brew cask install docker

# Install Ansible
brew install ansible

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
brew install httpie

echo Installing lns
curl -o ~/bin/lns http://interglacial.com/~sburke/pub/lns
chmod u+x ~/bin/lns
echo Finished installing lns

# Install fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro
brew cask install font-firacode-nerd-font

# Install Karabiner Elements
brew cask install karabiner-elements

# Install Hammerspoon
brew cask install hammerspoon

# Install mosh
brew install mosh

# Install Redis
brew install redis

# Install memcached
brew install memcached

# Install Aerial screen saver
brew cask install aerial

# Install ngrok local port forwarding tool
brew cask install ngrok

# Install cookiecutter
brew install cookiecutter

#
# Logging
#

# Install lnav
brew install lnav

echo --------------------------------------------------------
echo Cloning dot files
echo --------------------------------------------------------

# Setup the dot files from git repo
# The following is to get around the fact that we cannot clone into a non empty directory.
echo Cloning dot files repo
git clone --separate-git-dir=$HOME/.dotconf https://github.com/treadup/dotfiles.git $HOME/dotconf-tmp
rm -r ~/dotconf-tmp/
/usr/bin/git --git-dir=$HOME/.dotconf/ --work-tree=$HOME config status.showUntrackedFiles no
/usr/bin/git --git-dir=$HOME/.dotconf/ --work-tree=$HOME checkout .
echo Finished cloning dot files repo

# Download git-prompt
echo Downloading git prompt
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
echo Finished downloading git prompt

echo --------------------------------------------------------
echo Cloning Emacs config
echo --------------------------------------------------------
# Download .emacs.d repo
echo Cloning Emacs configuration repo
git clone https://github.com/treadup/.emacs.d.git ~/.emacs.d
echo Finished cloning Emacs configuration repo

echo --------------------------------------------------------
echo Installing Common Lisp
echo --------------------------------------------------------

echo Installing Steel Bank Common Lisp
brew install sbcl

echo Installing Quicklisp
curl -o ~/.quicklisp/quicklisp.lisp https://beta.quicklisp.org/quicklisp.lisp
curl -o ~/.quicklisp/quicklisp.lisp.asc https://beta.quicklisp.org/quicklisp.lisp.asc
sbcl --script ~/.quicklisp/install-quicklisp.lisp

echo Installing quicklisp-slime-helper
sbcl --eval '(ql:quickload :quicklisp-slime-helper)' --quit

echo Installing Swank
sbcl --eval '(ql:quickload "swank")' --quit

echo --------------------------------------------------------
echo Installing Python
echo --------------------------------------------------------

echo Installing python
brew install python

echo Installing python3
brew install python3

# Create folder for Python virutal environments.
mkdir ~/.virtualenvs/

echo Installing virtualfish
python -m pip install virtualfish

# Install poetry
# Make sure that poetry uses python3 when creating new projects
# by replacing /usr/bin/env python with /usr/bin/env python3
# curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py  | \
#    sed 's_/usr/bin/env python_/usr/bin/env python3_g' | python3

echo Finished installing Python packages

echo --------------------------------------------------------
echo Installing Node
echo --------------------------------------------------------

echo Installing node
brew install node

# Fix npm permissions issue
# https://docs.npmjs.com/getting-started/fixing-npm-permissions
mkdir -p ~/.npm-global
npm config set prefix ~/.npm-global

echo Installing node programs
npm install -g jsonlint
npm install -g yarn
npm install -g json

echo Finished installing node programs

echo --------------------------------------------------------
echo Installing Golang
echo --------------------------------------------------------

echo Installing Go
brew install go

export GOPATH=$HOME/go

# Add the users bin folder to the path.
export PATH=$GOPATH/bin:$PATH

# Setup the Go workspace
mkdir -p ~/go

# Install Go programs
echo Installing Go programs
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v golang.org/x/tools/cmd/godoc

# Install ppd
go get github.com/treadup/ppd

# Install dj
go get github.com/treadup/dj

echo Finished installing Go programs

echo --------------------------------------------------------
echo Installation finished
echo --------------------------------------------------------
echo
echo Either generate a new GPG key or import an existing GPG key.
echo To generate a new GPG key use the following command.
echo
echo    gpg --gen-key
echo
echo Next initialize pass by executing the following commands.
echo
echo     pass init \<email\>
echo     pass git init
echo
echo Use the email address associated with the GPG key that should be used.
echo
echo Remember to configure the keyboard.
echo Use F1, F2, etc keys as function keys
echo Key Repeat should be Fast
echo Delay Until Repeat should be Short
echo Modifier Keys use Caps Lock as Control
