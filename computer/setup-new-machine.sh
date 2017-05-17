#!/bin/bash

# Setup the dot files from git repo
# The following is to get around the fact that we cannot clone into a non empty directory.
git init
git remote add origin https://github.com/treadup/DotFiles.git
git fetch origin
git checkout -b master --force --track origin/master
git remote set-url origin git@github.com:treadup/DotFiles.git # Change to using ssh

# Source the downloaded bashrc file. Bash should now be in sync with the configuration
# in the DotFiles repo.
source ~/.bashrc

# Download .emacs.d repo
git clone https://github.com/treadup/.emacs.d.git
cd ~/.emacs.d/
git remote set-url origin git@github.com:treadup/.emacs.d.git
cd ~/

# Install the VIM package manger Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# It is better to install the Vim plugins the first time you open Vim.
# vim +PluginInstall +qall # Install all the plugins

# Install the fonts needed to correctly display VIM powerline/airline.
mkdir powerline_fonts
git clone https://github.com/powerline/fonts.git powerline_fonts
~/powerline_fonts/install.sh
rm -rf ~/powerline_fonts

# Create the .bookmarks repo. Remember to import these bookmarks into Firefox.
mkdir ~/.bookmarks/
cd ~/.bookmarks/
git init
git remote add origin git@github.com:treadup/.bookmarks.git
cd ~/

# Install the moderncv latex package
tlmgr -v init-usertree
tlmgr install moderncv

# Create the bin folder.
mkdir -p ~/bin

# Install Clojure
curl -o ~/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod 755 ~/bin/lein
~/bin/lein

# Install node programs
# https://docs.npmjs.com/getting-started/fixing-npm-permissions
mkdir -p ~/.npm-global
npm config set prefix ~/.npm-global

npm install -g jshint
npm install -g js-beautify
npm install -g tern
npm install -g eslint

# OS X specific setup
if [[ "$OSTYPE" == "darwin"* ]]; then
    # airport
    ln -sf /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport ~/bin/airport

    # emacs
    ln -sf ~/bin/emacs-on-mac.sh ~/bin/emacs
fi

# Setup the Go workspace
mkdir ~/go

# Setup the password store
echo Remember that you now have to setup gpg and pass
echo To set up pass remember to use pass git init instead of pass init
echo
echo To install PyCharm on Ubuntu use the following command.
echo     umake ide pycharm
echo
echo To install IntelliJ IDEA on Ubuntu use the following command.
echo     umake ide idea
echo
echo To install the Atom text editor on Ubuntu use the following command.
echo     umake ide atom
echo
