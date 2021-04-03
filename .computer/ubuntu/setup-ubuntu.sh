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

# Run all Ubuntu commands non interactively
export DEBIAN_FRONTEND=noninteractive

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

# Change to the user home folder. Being in the /root folder
# causes issues when executing commands with sudo -u henrik
cd /home/henrik

echo ---------------------------------
echo Creating standard folders
echo ---------------------------------
sudo -u henrik bash <<"EOF"
set -e
set -u

echo Create the user bin, lib and include folders.
mkdir -p /home/henrik/{bin,lib,include}

echo Create code folder
mkdir -p ~/code/{clojure,docker,lisp,go,javascript,python,ruby}
EOF

echo ---------------------------------
echo Installing base packages
echo ---------------------------------

echo Install english language pack
apt-get --yes install language-pack-en

echo Install git
apt-get --yes install git
sudo -u henrik git config --global core.excludesfile /home/henrik/.gitignore_global

echo ---------------------------------
echo Installing security packages
echo ---------------------------------

echo Installing sudo
apt-get --yes install sudo

# Install GnuPG
apt-get --yes install gnupg

# Install password utilities
apt-get --yes install pass pwgen

echo ---------------------------------
echo Installing editors
echo ---------------------------------

echo Installing Emacs
if [ -v DISPLAY ]; then
    apt --yes install emacs
else
    apt --yes install emacs-nox
fi

echo Installing Vim
apt-get --yes install vim

echo ---------------------------------
echo Installing Shells
echo ---------------------------------

echo Installing fish shell
apt-get --yes install fish

echo Stop the /bin/open command from shadowing the fish open command.
if [ -f /bin/open ]; then
    mv /bin/open /bin/oldkbdopen
fi

echo Installing bash completion
# This might already be installed...
apt-get --yes install bash-completion

echo Installing direnv
apt-get install -y direnv

echo ---------------------------------
echo Installing command line tools
echo ---------------------------------

echo Installing cli trash command
apt-get --yes install trash-cli

echo Installing zip
apt-get --yes install zip unzip

echo Installing http cli clients
apt-get --yes install curl wget httpie aria2

echo Installing ag
apt-get --yes install silversearcher-ag

echo Installing fzy
apt-get install -y fzy

echo Installing pick
apt-get install -y pick

echo ---------------------------------
echo Installing network tools
echo ---------------------------------

echo Installing tmux
apt-get --yes install tmux

echo Installing network tools
apt-get --yes install whois

echo Installing mosh
apt-get --yes install mosh

echo -------------------------------------------------
echo Installing Document Tools
echo -------------------------------------------------

echo Installing TeX and LaTex
# For some reason xzdec is needed to get tlmgr to work
apt-get --yes install texlive-full xzdec

echo Install pandoc
apt-get --yes install pandoc

echo Installing markdown
apt-get install -y markdown

echo ---------------------------------
echo Installing Node
echo ---------------------------------

echo Installing node and npm
# The node ecosystem expects the node executable to be called node.
# Therefore create a symlink to the correct name.
apt-get --yes install nodejs npm

echo ---------------------------------
echo Installing Cloud Provider tools
echo ---------------------------------

echo Installing aws cli command
apt-get --yes install awscli

echo ---------------------------------
echo Installing C programming tools
echo ---------------------------------

echo Installing GCC and make among other things
apt-get --yes install build-essential

echo Installing LLVM and CLang
apt-get --yes install llvm clang

echo Installing gdb
apt-get --yes install gdb

echo Installing cmake
apt-get --yes install cmake cmake-doc

echo --------------------------------------
echo Installing SDL and SDL2
echo --------------------------------------

echo Installing SDL 1.2
apt-get install -y libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev

echo Installing SDL 2
apt-get install -y libsdl2-dev

echo ---------------------------------
echo Installing container tools
echo ---------------------------------
echo Installing docker
apt-get --yes install docker.io

echo Installing packer
apt-get --yes install packer

echo Installing nomad
apt-get --yes install nomad

echo --------------------------------------------
echo Installing contfiguration management tools
echo --------------------------------------------

echo Installing Ansible
apt-get --yes install ansible

echo ---------------------------------
echo Installing Java tools
echo ---------------------------------

echo Installing Java8 SDK
apt-get --yes install default-jdk
# apt-get --yes install openjdk-8-jdk

# Set the JAVA_HOME environment variable. You need to log out and
# then log back in again for the /etc/environment file to be reloaded.
JAVA_HOME="$(dirname $(dirname $(readlink -e $(which javac))))"
printf "JAVA_HOME=$JAVA_HOME\n" >> /etc/environment

echo ---------------------------------
echo Installing Databases
echo ---------------------------------

echo Installing PostgreSQL
apt-get install --yes postgresql postgresql-doc postgresql-contrib postgresql-client
sudo apt-get install --yes pgcli

echo Installing Redis
apt-get install --yes redis
apt-get install --yes redis-tools

echo Installing sqlite3
apt-get install --yes sqlite3 libsqlite3-dev

# Install MariaDB
# apt-get install --yes mariadb-server mariadb-client
# apt-get install --yes mycli

echo ---------------------------------
echo Installing Lisps
echo ---------------------------------

echo Installing Steel Bank Common Lisp
apt-get --yes install sbcl sbcl-doc sbcl-source

# Install CLISP
apt-get --yes install clisp

# Install Gambit Scheme
# apt-get --yes install gambc

# Install MIT Scheme
# apt-get --yes install mit-scheme

# Install Racket
# apt-get --yes install racket

echo ---------------------------------
echo Installing Go
echo ---------------------------------

echo Installing Go
apt-get --yes install golang-go

echo ---------------------------------
echo Installing Python
echo ---------------------------------

echo Installing Python
apt-get --yes install python3-pip python3-dev python3-setuptools python3-wheel python3-venv

echo Installing pipenv
sudo apt-get -y install pipenv

echo ---------------------------------
echo Installing Ruby
echo ---------------------------------

echo Installing Ruby
apt-get --yes install ruby ruby-dev

echo ---------------------------------
echo Installing Rust
echo ---------------------------------

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

echo ---------------------------------
echo Installing Lua
echo ---------------------------------

echo Installing Lua
apt-get --yes install lua5.3
apt-get --yes install liblua5.3-dev

# echo Install Löve2D
# add-apt-repository --yes ppa:bartbes/love-stable
# apt-get --yes update
# apt-get --yes install love

echo -----------------------------------
echo Installing webservers
echo -----------------------------------

echo Installing nginx
apt-get install -y nginx

echo ------------------------------------
echo Installing Fonts
echo ------------------------------------

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

echo -----------------------------------
echo Finishing package installation
echo -----------------------------------

echo  Remove packages that are no longer needed
apt-get --yes autoremove

echo Enable unattended security updates
apt-get --yes install  unattended-upgrades
# See https://help.ubuntu.com/lts/serverguide/automatic-updates.html.en
# To configure unattended upgrades of all packages see the above link.

echo Finished installing packages

echo ---------------------------------
echo Cloning dotfiles repo
echo ---------------------------------
# The following is to get around the fact that we cannot clone into a non empty directory.
# Use a here document for this instead
sudo -u henrik bash <<"EOF"
set -e
set -u
if [ ! -d /home/henrik/.dotconf/ ]; then
    echo Cloning dot files repo
    git clone --separate-git-dir=/home/henrik/.dotconf https://github.com/treadup/dotfiles.git /home/henrik/dotconf-tmp
    rm -r /home/henrik/dotconf-tmp/
    /usr/bin/git --git-dir=/home/henrik/.dotconf/ --work-tree=/home/henrik config status.showUntrackedFiles no
    /usr/bin/git --git-dir=/home/henrik/.dotconf/ --work-tree=/home/henrik checkout .
    echo Finished cloning dot files repo
else
    echo The dot files repo already exists
fi

echo Downloading git prompt
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o /home/henrik/.git-prompt.sh
echo Finished downloading git prompt
EOF

echo ---------------------------------
echo Cloning Emacs configuration repo
echo ---------------------------------
sudo -u henrik bash <<"EOF"
set -e
set -u

if [ ! -d /home/henrik/.emacs.d/ ]; then
    # Download .emacs.d repo
    echo Cloning Emacs init file repo
    git clone https://github.com/treadup/.emacs.d.git /home/henrik/.emacs.d
    echo Finished cloning Emacs config file repo
else
    echo The emacs config repo already exists
fi
EOF

echo ---------------------------------
echo Setting up Common Lisp
echo ---------------------------------
sudo -u henrik bash <<"EOF"
set -e
set -u

# Install Quicklisp
if [ ! -f /home/henrik/.quicklisp/quicklisp.lisp ]; then
    curl -o /home/henrik/.quicklisp/quicklisp.lisp https://beta.quicklisp.org/quicklisp.lisp
    curl -o /home/henrik/.quicklisp/quicklisp.lisp.asc https://beta.quicklisp.org/quicklisp.lisp.asc
    sbcl --script /home/henrik/.quicklisp/install-quicklisp.lisp

    # Install quicklisp-slime-helper
    sbcl --eval '(ql:quickload :quicklisp-slime-helper)' --quit

    # Install Swank
    sbcl --eval '(ql:quickload "swank")' --quit
fi
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

echo Installing vritualfish
pip3 install virtualfish

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

npm install -g jsonlint
npm install -g yarn

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
export GOPATH=/home/henrik/go

# The -E flag is needed for go get to work inside a sudo call
sudo -E -u henrik bash <<"EOF"
set -e
set -u

# This is needed since we are using the -E flag in the sudo call
export HOME=/home/henrik

# Setup the Go workspace
mkdir -p /home/henrik/go

# Install Go programs
echo Installing Go programs
cd /home/henrik
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v golang.org/x/tools/cmd/godoc
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

echo Installing fd
sudo -u henrik /home/henrik/.cargo/bin/cargo install fd-find

echo -------------------------------------
echo Setup authorized_keys for user henrik
echo -------------------------------------

if [ -f /root/.ssh/authorized_keys ]; then
    echo Using root authorized_keys file for user henrik
    cp /root/.ssh/authorized_keys /home/henrik/.ssh/
    chown henrik:henrik /home/henrik/.ssh/authorized_keys
fi

echo --------------------------------------
echo Configure fish shell
echo --------------------------------------

# Install virtualfish for activating Python virtual environments

# For some reason we cannot run fish as the user henrik if we are not
# in a folder that is readable by the user henrik
cd /home/henrik
sudo -u henrik fish -c 'vf install'
cd /root

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
