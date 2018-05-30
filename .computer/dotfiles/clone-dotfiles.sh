#!/bin/bash

# This is from the following Hacker News comment.
# https://news.ycombinator.com/item?id=11071754

# Clone dotfiles into a temporary directory which is then removed.
# This is to get around the fact that the home folder is usually not
# empty.
git clone --separate-git-dir=$HOME/.dotconf https://github.com/treadup/dotfiles.git $HOME/dotconf-tmp
rm -r ~/dotconf-tmp/
/usr/bin/git --git-dir=$HOME/.dotconf/ --work-tree=$HOME config status.showUntrackedFiles no
