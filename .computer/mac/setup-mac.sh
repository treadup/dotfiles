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
echo Installing Base Packages
echo --------------------------------------------------------

echo Installing Git
brew install git
git config --global core.excludesfile ~/.gitignore_global

echo Installing coreutils
brew install coreutils

echo --------------------------------------------------------
echo Installing Security Packages
echo --------------------------------------------------------

echo Installing GPG
brew install gnupg2
brew install pinentry-mac
ln -s $HOME/.gnupg/gpg-agent.conf.macos $HOME/.gnupg/gpg-agent.conf

echo Installing pass
brew install pass

echo Installing pwgen
brew install pwgen

echo --------------------------------------------------------
echo Installing Shells
echo --------------------------------------------------------

echo Installing Fish shell
brew install fish

echo Installing bash completion
brew install bash-completion

echo Installing direnv
brew install direnv

echo --------------------------------------------------------
echo Installing Editors
echo --------------------------------------------------------

echo Installing Emacs
brew cask install emacs

echo Installing Vim
brew install vim

echo Installing JetBrains Toolbox
brew cask install jetbrains-toolbox

echo --------------------------------------------------------
echo Installing Network Tools
echo --------------------------------------------------------

echo Installing tmux
brew install tmux

echo Installing screen
brew install screen

echo Installing parallel ssh
brew install pssh

echo Install telnet
brew install telnet

echo Installing mosh
brew install mosh

echo Installing ngrok local port forwarding tool
brew cask install ngrok

echo Installing Firefox
brew cask install firefox

echo --------------------------------------------------------
echo Installing Java
echo --------------------------------------------------------

echo Installing Java
brew cask install adoptopenjdk

echo --------------------------------------------------------
echo Installing Clojure
echo --------------------------------------------------------

echo Install Clojure
brew install clojure
brew install leiningen

echo --------------------------------------------------------
echo Installing Ruby
echo --------------------------------------------------------

echo Installing Ruby
brew install ruby

echo --------------------------------------------------------
echo Installing Lua
echo --------------------------------------------------------

echo Installing Lua
brew installing lua
brew install luarocks

echo Installing Löve2D
brew cask install love

echo --------------------------------------------------------
echo Installing Erlang
echo --------------------------------------------------------

echo Installing Erlang
brew install erlang

echo Installing rebar3
brew install rebar3

echo --------------------------------------------------------
echo Installing Rust
echo --------------------------------------------------------

echo Installing Rust
brew install rustup
rustup-init -y --no-modify-path

echo ---------------------------------------------------------
echo Installing Servers
echo ---------------------------------------------------------

echo Installing nginx server
brew install nginx

echo Installing Traefik
brew install traefik

echo Installing RabbitMQ
brew install rabbitmq

echo Installing Redis
brew install redis

# echo Installing memcached
# brew install memcached

echo ---------------------------------------------------------
echo Installing Databases
echo ---------------------------------------------------------

echo Installing PostgreSQL
brew install postgresql
brew install pgcli

echo Installing MariaDB
brew install mariadb
brew install mycli

echo ---------------------------------------------------------
echo Installing Cloud Tools
echo ---------------------------------------------------------

echo Installing Heroku CLI
brew tap heroku/brew
brew install heroku

echo Installing awscli
brew install awscli

echo ---------------------------------------------------------
echo Installing Document Tools
echo ---------------------------------------------------------

echo Installing TeX
brew cask install basictex
# brew cask install mactex

echo Installing multimarkdown
brew install multimarkdown

echo ---------------------------------------------------------
echo Installing Container Tools
echo ---------------------------------------------------------

echo Installing VirtualBox
brew cask install virtualbox

# Install Docker
# Install docker from the website. Otherwise things like docker-compose
# will not be setup correctly.
# brew install docker
# brew cask install docker

# echo Installing Nomad
# brew tap hashicorp/tap
# brew install hashicorp/tap/nomad

echo ---------------------------------------------------------
echo Installing Command Line Tools
echo ---------------------------------------------------------

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
brew install pick
brew install trash
brew install htop
brew install glances
brew install httpie

echo ---------------------------------------------------------
echo Installing Fonts
echo ---------------------------------------------------------

echo Installing fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro
brew cask install font-firacode-nerd-font

echo ---------------------------------------------------------
echo Installing Accessability Tools
echo ---------------------------------------------------------

echo Installing Rectangle
brew install --cask rectangle

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
