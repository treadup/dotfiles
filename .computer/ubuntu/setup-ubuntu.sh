#!/bin/bash

# Exit this script if there are any errors.
set -e

# Exit script if it tries to use an uninitialized variable.
set -u

# Check if we are running with root permissions
if [ $EUID -ne 0 ]; then
    echo This script must be run with root permissions.
    echo Execute this script as root or using sudo.
    exit 1
fi

echo ---------------------------------
echo Upgrading system
echo ---------------------------------

echo Updating apt
apt-get --yes update

echo Upgrading system
apt-get --yes upgrade

echo ---------------------------------
echo Creating user
echo ---------------------------------

groupadd -f sudo
groupadd -f docker
if [ $(id -u henrik) ]; then
   echo User henrik already exists
else
   echo Creating user henrik
   useradd -G sudo,docker -m henrik
fi

echo ---------------------------------
echo Creating standard folders
echo ---------------------------------
sudo -u henrik bash <<"EOF"
set -e
set -u

# Create the user bin, lib and include folders.
mkdir -p ~/bin ~/lib ~/include

# Create code folder
mkdir -p ~/code/lisp ~/code/go ~/code/clojure
mkdir -p ~/code/javascript ~/code/python
mkdir -p ~/code/racket ~/code/docker
EOF

echo ---------------------------------
echo Installing packages
echo ---------------------------------

# Change to the user home folder. Being in the /root folder
# causes issues when executing commands with sudo -u henrik
cd /home/henrik

echo Installing sudo
apt-get --yes install sudo

echo Installing packages

# Install english language pack
apt-get --yes install language-pack-en

# Install git
apt-get --yes install git
sudo -u henrik git config --global core.excludesfile /home/henrik/.gitignore_global

# Install GnuPG
apt-get --yes install gnupg

# Install password utilities
apt-get --yes install pass pwgen

# Install Emacs
if [ -v DISPLAY ]; then
    apt --yes install emacs
else
    apt --yes install emacs-nox
fi

# Install Vim
apt-get --yes install vim

# Install Shells
apt-get --yes install fish

# Stop the /bin/open command from shadowing the fish open command.
if [ -f /bin/open ]; then
    mv /bin/open /bin/oldkbdopen
fi

# Install bash completion
# This might already be installed...
apt-get --yes install bash-completion

# Install cli trash command
apt-get --yes install trash-cli

# Install lns
sudo -u henrik bash <<"EOF"
set -e
set -u

echo Installing lns
curl -o ~/bin/lns http://interglacial.com/~sburke/pub/lns
chmod u+x ~/bin/lns
echo Finished installing lns
EOF

# Install ubuntu make
apt-get --yes install ubuntu-make

# Install zip
apt-get --yes install zip unzip

# Install node and npm
# The node ecosystem expects the node executable to be called node.
# Therefore create a symlink to the correct name.
apt-get --yes install nodejs npm

# Install texlive
# For some reason xzdec is needed to get tlmgr to work
apt-get --yes install texlive-full xzdec

# Install http cli clients
apt-get --yes install curl wget httpie aria2

# Install ag
apt-get --yes install silversearcher-ag

# Install tmux
apt-get --yes install tmux

# Install network tools
apt-get --yes install whois

# Install mosh
apt-get --yes install mosh

# Install pandoc
apt-get --yes install pandoc

# Install aws cli command
apt-get --yes install awscli

# Install GCC and make among other things
apt-get --yes install build-essential

## Install LLVM and CLang
apt-get --yes install llvm clang

# Install gdb
apt-get --yes install gdb

# Install cmake
apt-get --yes install cmake cmake-doc

# Install docker
apt-get --yes install docker.io

# Install packer
apt-get --yes install packer

# Install Ansible
apt-get --yes install ansible

# Install Java8 SDK
apt-get --yes install default-jdk
# apt-get --yes install openjdk-8-jdk

# Set the JAVA_HOME environment variable. You need to log out and
# then log back in again for the /etc/environment file to be reloaded.
JAVA_HOME="$(dirname $(dirname $(readlink -e $(which javac))))"
printf "JAVA_HOME=$JAVA_HOME\n" >> /etc/environment

#
# Lisp
#

# Install Steel Bank Common Lisp
apt-get --yes install sbcl sbcl-doc sbcl-source

# Install CLISP
apt-get --yes install clisp

# Install Gambit Scheme
apt-get --yes install gambc

# Install MIT Scheme
apt-get --yes install mit-scheme

# Install Racket
apt-get --yes install racket

#
# Go
#

# Install Go
apt-get --yes install golang-go

#
# Python
#

# Install Python
apt-get --yes install python-pip python3-pip python3-dev \
   python3-setuptools python3-wheel python3-venv

#
# Ruby
#

# Install Ruby
apt-get --yes install ruby

#
# Rust
#

# Install Rust using rustup in instead
# apt-get --yes install rustc
# apt-get --yes install cargo

sudo -u henrik bash <<"EOF"
set -e
set -u
echo Installing rust
curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
echo Finished installing rust
EOF

#
# Lua
#

# Install Lua
apt-get --yes install lua5.3
apt-get --yes install liblua5.3-dev

# Install Löve2D
add-apt-repository --yes ppa:bartbes/love-stable
apt-get --yes update
apt-get --yes install love

#
# Other
#

# Install weechat
apt-get --yes install weechat

# Install nginx
apt-get install -y nginx

# Install direnv
apt-get install -y direnv

# Install markdown
apt-get install -y markdown

# Install lnav
apt-get install -y lnav

# Install ranger
apt-get install -y ranger

# Install yank
apt-get install -y yank

# Install fzy
apt-get install -y fzy

# Install pick
apt-get install -y pick

# Install cookiecutter
apt-get install -y cookiecutter

#
# Graphics
#

# Install SDL 1.2
apt-get install -y libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev

# Install SDL 2
apt-get install -y libsdl2-dev

#
# Email
#

# Install msmtp smtp client
apt-get install -y msmtp

# Install isync package which contains mbsync.
apt-get install -y isync

#
# Fonts
#

# Install Fira Code fonts
apt-get install -y fonts-firacode

# Install DejaVu fonts
apt-get install -y fonts-dejavu

# Install Liberation fonts
apt-get install -y fonts-liberation

# Install Inconsolata font
apt-get install -y fonts-inconsolata

# Install powerline fonts
# This package provides the fonts used by powerline. This package
# also contains the fontconfig settings that make these symbols
# available as part of other installed fonts.
# In other words the fonts-powerline only modifies existing fonts.
# It does not install complete new font families.
apt-get install -y fonts-powerline

# Remove packages that are no longer needed
apt-get --yes autoremove

# Enable unattended security updates
# See https://help.ubuntu.com/lts/serverguide/automatic-updates.html.en
# To configure unattended upgrades of all packages see the above link.
apt-get --yes install  unattended-upgrades

echo Finished installing packages
# echo The installation script ran successfully.

echo ---------------------------------
echo Cloning dotfiles repo
echo ---------------------------------
# The following is to get around the fact that we cannot clone into a non empty directory.
# Use a here document for this instead
sudo -u henrik bash <<"EOF"
set -e
set -u
echo Cloning dot files repo
git clone --separate-git-dir=/home/henrik/.dotconf https://github.com/treadup/dotfiles.git /home/henrik/dotconf-tmp
rm -r /home/henrik/dotconf-tmp/
/usr/bin/git --git-dir=/home/henrik/.dotconf/ --work-tree=/home/henrik config status.showUntrackedFiles no
/usr/bin/git --git-dir=/home/henrik/.dotconf/ --work-tree=/home/henrik checkout .
echo Finished cloning dot files repo

echo Downloading git prompt
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o /home/henrik/.git-prompt.sh
echo Finished downloading git prompt
EOF

echo ---------------------------------
echo Cloning dotfiles repo
echo ---------------------------------
sudo -u henrik bash <<"EOF"
set -e
set -u
# Download .emacs.d repo
echo Cloning Emacs init file repo
git clone https://github.com/treadup/.emacs.d.git /home/henrik/.emacs.d
echo Finished cloning Emacs init file repo
EOF

echo ---------------------------------
echo Setting up Common Lisp
echo ---------------------------------
sudo -u henrik bash <<"EOF"
set -e
set -u

# Install Quicklisp
curl -o /home/henrik/.quicklisp/quicklisp.lisp https://beta.quicklisp.org/quicklisp.lisp
curl -o /home/henrik/.quicklisp/quicklisp.lisp.asc https://beta.quicklisp.org/quicklisp.lisp.asc
sbcl --script /home/henrik/.quicklisp/install-quicklisp.lisp

# Install quicklisp-slime-helper
sbcl --eval '(ql:quickload :quicklisp-slime-helper)' --quit

# Install Swank
sbcl --eval '(ql:quickload "swank")' --quit
EOF

echo ---------------------------------
echo Setting up Python
echo ---------------------------------
# Quoting the limit string makes it so that the characters
# in the here doc are escaped. In other words this means
# that you can use $PATH in your here doc and it will
# be the path of the user henrik and not root.
sudo -u henrik bash <<"EOF"
set -e
set -u

# Create folder for Python virutal environments.
mkdir -p /home/henrik/.virtualenvs/

# Install Python packages
echo Installing Python packages

echo Installing pipx
export PATH=$HOME/.local/bin:$PATH
python3 -m pip install pipx
python3 -m pipx ensurepath

pipx install black
pipx install virtualenv
pipx install httpie
pipx install html2text
pipx install pylint
pipx install flake8
pipx install flake8-bugbear
pipx install autopep8
pipx install python-language-server
pipx install isort
pipx install yamllint
pipx install pur
pipx install yq

# Install database utilities
pipx install pgcli
pipx install mycli

# Install vritualfish
pipx install virtualfish

# Install poetry
# Make sure that poetry uses python3 when creating new projects
# by replacing /usr/bin/env python with /usr/bin/env python3
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py  | \
    sed 's_/usr/bin/env python_/usr/bin/env python3_g' | python3

echo Finished installing Python packages
EOF

echo ---------------------------------
echo Setting up Node
echo ---------------------------------
sudo -u henrik bash <<"EOF"
set -e
set -u

echo Installing node.js programs
cd $HOME

# https://docs.npmjs.com/getting-started/fixing-npm-permissions
mkdir -p /home/henrik/.npm-global
npm config set prefix /home/henrik/.npm-global

npm install -g jshint
npm install -g js-beautify
npm install -g prettier
npm install -g tern
npm install -g eslint
npm install -g jsonlint
npm install -g js-yaml
npm install -g nd
npm install -g create-react-app
npm install -g yarn
npm install -g tldr
npm install -g json
npm install -g netlify-cli
npm install -g @11ty/eleventy

# Expo
npm install -g create-react-native-app
npm install -g expo-cli

# React Native Cli
npm install -g react-native-cli

# Install Vue cli
npm install -g @vue/cli

echo Finished installing node.js programs
EOF

echo ---------------------------------
echo Setting up Clojure
echo ---------------------------------
sudo -u henrik bash <<"EOF"
set -e
set -u

# Installing Leiningen
echo Installing lein
curl -o /home/henrik/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod 755 /home/henrik/bin/lein
echo Finished installing lein
EOF

echo ---------------------------------
echo Setting up Go
echo ---------------------------------
sudo -u henrik bash <<"EOF"
set -e
set -u

# Setup the Go workspace
mkdir /home/henrik/go

export GOPATH=/home/henrik/go

# Install Go programs
echo Installing Go programs
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v golang.org/x/tools/cmd/godoc
go get -u -v golang.org/x/net/websocket
go get -u -v github.com/motemen/gore
go get -u -v github.com/junegunn/fzf

# Install ppd
go get github.com/treadup/ppd

# Install dj
go get github.com/treadup/dj

echo Finished installing Go programs
EOF

echo ---------------------------------
echo Setting up Rust
echo ---------------------------------

sudo -u henrik /home/henrik/.cargo/bin/cargo install fd-find

echo ---------------------------------
echo End notes
echo ---------------------------------
echo Remember to setup the password store
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
