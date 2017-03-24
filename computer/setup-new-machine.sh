#!/bin/bash

# Setup the dot files from git repo
# The following is to get around the fact that we cannot clone into a non empty directory.
git init
git remote add origin https://github.com/treadup/DotFiles.git
git fetch origin
git checkout -b master --force --track origin/master
git remote set-url origin git@github.com:treadup/DotFiles.git # Change to using ssh

# Download .emacs.d repo
git clone https://github.com/treadup/.emacs.d.git
cd ~/.emacs.d/
git remote set-url origin git@github.com:treadup/.emacs.d.git
cd ~/

# Download Spacemacs
# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Install the VIM package manger Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall # Install all the plugins

case "$OSTYPE" in
  darwin*)  echo "OSX" ;; 
  linux*)   echo "LINUX" ;;
  *)        echo "unknown: $OSTYPE. Do not know how to install the powerline fonts on this system" ;;
esac

# Install the fonts needed to correctly display VIM powerline/airline.
mkdir powerline_fonts
git clone https://github.com/powerline/fonts.git powerline_fonts
~/powerline_fonts/install.sh
rm -rf ~/powerline_fonts

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

# Set the prefix to the home folder. This will make npm install things
# in the ~/bin folder which is already in the path.
npm config set prefix ~
npm install -g jshint
npm install -g js-beautify
npm install -g tern

# Setup the password store
echo Remember that you now have to setup gpg and pass
echo To set up pass remember to use pass git init instead of pass init
