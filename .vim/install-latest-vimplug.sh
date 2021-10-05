#!/bin/sh

echo Downloading vim-plug plugin manger
curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo You might want to commit the ~/.vim/autoload/plug.vim file to the dotfiles repo.
