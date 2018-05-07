#!/bin/bash

# Exit this script if there are any errors.
set -e

# Exit script if it tries to use an uninitialized variable.
set -u

# Make sure that we are in the home folder.
cd ~/

# Setup the dot files from git repo
# The following is to get around the fact that we cannot clone into a non empty directory.
yadm init
yadm remote add origin git@github.com:treadup/dotfiles.git
yadm fetch origin
yadm checkout -b master --force --track origin/master
yadm config status.showUntrackedFiles no

# Source the downloaded bashrc file. Bash should now be in sync with the configuration
# in the DotFiles repo.
source ~/.bashrc

# Download .emacs.d repo
git clone https://github.com/treadup/.emacs.d.git ~/.emacs.d

# Install the VIM package manger Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Download git-prompt
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh

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
rm -rf ~/nerd_fonts

# Install the moderncv latex package
tlmgr -v init-usertree
tlmgr install moderncv

# Create the bin folder.
mkdir -p ~/bin

# Install Python packages
pip3 install virtualenv
pip3 install pipenv
pip3 install httpie
pip3 install html2text
pip3 install pylint
pip3 install flake8
pip3 install yamllint

# Install vritualfish
pip3 install virtualfish

# Install Clojure
curl -o ~/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod 755 ~/bin/lein

# Install node programs
# https://docs.npmjs.com/getting-started/fixing-npm-permissions
mkdir -p ~/.npm-global
npm config set prefix ~/.npm-global

npm install -g jshint
npm install -g js-beautify
npm install -g tern
npm install -g eslint
npm install -g jsonlint
npm install -g js-yaml

# Setup the Go workspace
mkdir ~/go

# Install Go programs
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v golang.org/x/tools/cmd/goimports

# Install ppd
go get github.com/treadup/ppd

# Install lns
curl -o ~/bin/lns http://interglacial.com/~sburke/pub/lns
chmod u+x ~/bin/lns

# Install circleci
curl -o ~/bin/circleci https://circle-downloads.s3.amazonaws.com/releases/build_agent_wrapper/circleci && chmod u+x ~/bin/circleci

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
