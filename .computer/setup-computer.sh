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

# Create ~/code folder
mkdir -p code/lisp code/go code/clojure code/javascript code/python code/racket code/docker

#
# Common Lisp
#

# Install Quicklisp
curl -o ~/.quicklisp/quicklisp.lisp https://beta.quicklisp.org/quicklisp.lisp
curl -o ~/.quicklisp/quicklisp.lisp.asc https://beta.quicklisp.org/quicklisp.lisp.asc
sbcl --script ~/.quicklisp/install-quicklisp.lisp

# Install quicklisp-slime-helper
sbcl --eval '(ql:quickload :quicklisp-slime-helper)' --quit

# Install Swank
sbcl --eval '(ql:quickload "swank")' --quit

#
# Python
#

# Create folder for Python virutal environments.
mkdir ~/.virtualenvs/

# Install Python packages
echo Installing Python packages
pip3 install black
pip3 install virtualenv
pip3 install httpie
pip3 install html2text
pip3 install pylint
pip3 install flake8
pip3 install flake8-bugbear
pip3 install autopep8
pip3 install python-language-server
pip3 install isort
pip3 install yamllint
pip3 install pur
pip3 install yq

# Install database utilities
pip3 install pgcli
pip3 install mycli

# Install neovim python packages
pip2 install neovim
pip3 install neovim

# Install vritualfish
pip3 install virtualfish
echo Finished installing Python packages

# Install poetry
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python

#
# Node
#

# Install node programs
# https://docs.npmjs.com/getting-started/fixing-npm-permissions
echo Installing node.js programs
mkdir -p ~/.npm-global
npm config set prefix ~/.npm-global

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

npm install -g parcel-bundler

npm install -g create-react-native-app
npm install -g expo-cli


npm install -g serverless

nmp install -g json

echo Finished installing node.js programs

#
# Clojure
#

# Installing Leiningen
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo Installing lein
    curl -o ~/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
    chmod 755 ~/bin/lein
    echo Finished installing lein
fi

npm install -g lumo-cljs

#
# Go
#

# Setup the Go workspace
mkdir ~/go

# Install Go programs
echo Installing Go programs
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v github.com/motemen/gore

# Install ppd
go get github.com/treadup/ppd

# Install dj
go get github.com/treadup/dj

echo Finished installing Go programs

#
# Git
#
git config --global core.excludesfile ~/.gitignore_global

#
# Misc
#

# Install fzf
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    go get -u -v github.com/junegunn/fzf
fi

# Install lns
echo Installing lns
curl -o ~/bin/lns http://interglacial.com/~sburke/pub/lns
chmod u+x ~/bin/lns
echo Finished installing lns

# Install fd which is an alternative to find
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    cargo install fd-find
fi

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
