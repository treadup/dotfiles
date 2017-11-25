#!/bin/bash

# Make sure that we are in the home folder.
cd ~/

# Setup the dot files from git repo
# The following is to get around the fact that we cannot clone into a non empty directory.
git init
git remote add origin https://github.com/treadup/dotfiles.git
git fetch origin
git checkout -b master --force --track origin/master
git remote set-url origin git@github.com:treadup/DotFiles.git # Change to using ssh

# Source the downloaded bashrc file. Bash should now be in sync with the configuration
# in the DotFiles repo.
source ~/.bashrc

# Download .emacs.d repo
git clone https://github.com/treadup/.emacs.d.git ~/computer/emacs

# Download the spacemacs repo.
git clone https://github.com/syl20bnr/spacemacs ~/computer/spacemacs

# Set which Emacs distribution to use.
ln -s ~/computer/spacemacs ~/.emacs.d

# Install the VIM package manger Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# It is better to install the Vim plugins the first time you open Vim.
# vim +PluginInstall +qall # Install all the plugins
# This is done using the :PluginInstall command inside Vim.

# Install the fonts needed to correctly display VIM powerline/airline.
mkdir ~/powerline_fonts
git clone https://github.com/powerline/fonts.git ~/powerline_fonts
~/powerline_fonts/install.sh
rm -rf ~/powerline_fonts

# Install nerd fonts
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git ~/nerd_fonts
chmod u+x ~/nerd_fonts/install.sh
~/nerd_fonts/install.sh

# Install the moderncv latex package
tlmgr -v init-usertree
tlmgr install moderncv

# Create the bin folder.
mkdir -p ~/bin

# Install Python packages
pip3 install virtualenv
pip3 install httpie

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
npm install -g jsonlint

# OS X specific setup
if [[ "$OSTYPE" == "darwin"* ]]; then
    # airport
    ln -sf /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport ~/bin/airport

    # emacs
    ln -sf ~/bin/emacs-on-mac.sh ~/bin/emacs
fi

# Setup the Go workspace
mkdir ~/go

# Install Go programs
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v golang.org/x/tools/cmd/goimports

# Download Spotify Cli
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    curl -o ~/bin/spotify-cli https://raw.githubusercontent.com/pwittchen/spotify-cli-linux/master/spotify-cli
    chmod u+x ~/bin/spotify-cli
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

# Solarized color scheme for Mate Terminal on Linux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    git clone https://github.com/oz123/solarized-mate-terminal.git ~/solarized-mate-terminal/
    bash ~/solarized-mate-terminal/solarized-mate.sh
    rm -rf ~/solarized-mate-terminal/
fi

git clone https://github.com/oh-my-fish/oh-my-fish ~/computer/oh-my-fish
~/computer/oh-my-fish/bin/install --noninteractive
