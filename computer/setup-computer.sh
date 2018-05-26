#!/bin/bash

# Exit this script if there are any errors.
set -e

# Exit script if it tries to use an uninitialized variable.
set -u

# Make sure that we are in the home folder.
cd ~/

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

# Download .emacs.d repo
echo Cloning Emacs init file repo
git clone https://github.com/treadup/.emacs.d.git ~/.emacs.d
echo Finished cloning Emacs init file repo

# Install the VIM package manger Vundle
echo Cloning Vundle repo
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo Finished cloning Vundle repo

# It is better to install the Vim plugins the first time you open Vim.
# vim +PluginInstall +qall # Install all the plugins
# This is done using the :PluginInstall command inside Vim.

# Create the bin folder.
mkdir -p ~/bin

#
# Common Lisp
#

# Install Quicklisp
curl -o ~/.quicklisp/quicklisp.lisp https://beta.quicklisp.org/quicklisp.lisp
curl -o ~/.quicklisp/quicklisp.lisp.asc https://beta.quicklisp.org/quicklisp.lisp.asc
sbcl --script ~/.quicklisp/install-quicklisp.lisp

# Install quicklisp-slime-helper
sbcl --eval '(ql:quickload :quicklisp-slime-helper)' --quit

# Install StumpWM dependencies
# I'm not sure this is really needed. Just installing "stumpwm" below will probably
# pull in all the required dependencies.
sbcl --eval '(ql:quickload "clx")' --quit
sbcl --eval ' (ql:quickload "cl-ppcre")' --quit
sbcl --eval ' (ql:quickload "alexandria")' --quit

# Install StumpWM
sbcl --eval '(ql:quickload "stumpwm")' --quit

# Fetch stumpwm-contrib
git clone https://github.com/stumpwm/stumpwm-contrib.git ~/.stumpwm.d/modules

# Install Swank
sbcl --eval '(ql:quickload "swank")' --quit

#
# Python
#

# Install Python packages
echo Installing Python packages
pip3 install virtualenv
pip3 install httpie
pip3 install html2text
pip3 install pylint
pip3 install flake8
pip3 install yamllint

# Install vritualfish
pip3 install virtualfish
echo Finished installing Python packages

# Installing lein
echo Installing lein
curl -o ~/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod 755 ~/bin/lein
echo Finished installing lein

# Install node programs
# https://docs.npmjs.com/getting-started/fixing-npm-permissions
echo Installing node.js programs
mkdir -p ~/.npm-global
npm config set prefix ~/.npm-global

npm install -g jshint
npm install -g js-beautify
npm install -g tern
npm install -g eslint
npm install -g jsonlint
npm install -g js-yaml
npm install -g nd
echo Finished installing node.js programs

# Setup the Go workspace
mkdir ~/go

# Install Go programs
echo Installing Go programs
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v golang.org/x/tools/cmd/goimports

# Install ppd
go get github.com/treadup/ppd
echo Finished installing Go programs

# Install lns
echo Installing lns
curl -o ~/bin/lns http://interglacial.com/~sburke/pub/lns
chmod u+x ~/bin/lns
echo Finished installing lns

# Symplink gpg-agent.conf on macos.
if [[ "$OSTYPE" == "darwin"* ]]; then
    ln -s $HOME/.gnupg/gpg-agent.conf.macos $HOME/.gnupg/gpg-agent.conf
fi

# Setup the password store
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
echo Install Vim plugins by running the :PluginInstall command inside Vim.
echo

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo To install PyCharm on Ubuntu use the following command.
    echo     umake ide pycharm
    echo
    echo To install IntelliJ IDEA on Ubuntu use the following command.
    echo     umake ide idea
    echo
    echo To install the Atom text editor on Ubuntu use the following command.
    echo     umake ide atom
    echo
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo Remember to configure the keyboard.
    echo Use F1, F2, etc keys as function keys
    echo Key Repeat should be Fast
    echo Delay Until Repeat should be Short
    echo Modifier Keys use Caps Lock as Control
fi
