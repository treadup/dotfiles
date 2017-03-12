#!/bin/bash

# Setup the dot files from git repo
# The following is to get around the fact that we cannot clone into a non empty directory.
git init
git remote add origin git@github.com:treadup/DotFiles.git
git fetch origin
git checkout -b master --force --track origin/master

# Download .emacs.d repo
git clone git@github.com:treadup/.emacs.d.git

# Install the moderncv latex package
tlmgr -v init-usertree
tlmgr install moderncv

# Create the bin folder.
mkdir -p ~/bin

# Install Clojure
curl -o ~/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod 755 ~/bin/lein
~/bin/lein

# Setup the password store
echo Remember that you now have to setup gpg and pass
echo To set up pass remember to use pass git init instead of pass init
