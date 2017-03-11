#!/bin/bash

if [-f ~/.already_configured]; then
    exit 0
fi

touch ~/.already_configured

# TODO: Make this section check if we are on Linux or Mac and
# install the packages with apt or brew as appropriate.

# Install packages.
apt-get --force-yes --yes update
apt-get --force-yes --yes upgrade
apt-get --force-yes --yes install language-pack-en pass git emacs24-nox vim trash-cli npm \
        httpie virtualenv silversearcher-ag xzdec screen whois pwgen \
        python3-dev python3-pip python3-setuptools \
        awscli pandoc texlive-full \
        heroku certbot \
        docker
apt-get --force-yes -yes autoremove

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

