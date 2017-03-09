"VIM configuration file

" The first thing we do is setup Vundle.
" The parts marked with 'required' are required
" for Vundle to work.
" https://github.com/VundleVim/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Load your plugins here.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
