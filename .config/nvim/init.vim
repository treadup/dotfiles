" This neovim configuration file will use the normal vim configuration

" For neovim to work it seems you have to have installed the neovim python
" module.
" This is done for both python2 and python3 with the following commands.
" pip2 install neovim
" pip3 install neovim

set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim

" Set location of python executables
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

source ~/.vimrc

