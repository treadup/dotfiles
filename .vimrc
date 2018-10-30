"VIM configuration file

" Figure out how abbreviations work in vim.

" A good place to find VIM plugins is the vimawesome.com site.

" The first thing we do is setup Vundle.
" The parts marked with 'required' are required
" for Vundle to work.
" https://github.com/VundleVim/Vundle.vim

set nocompatible              " Run as vim and not as vi compatible, required
filetype off                  " required

" The fish shell seems to cause issues with Vundle so we use bash instead.
set shell=/bin/bash

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Color theme
Plugin 'dracula/vim'
" Plugin 'jnurmine/zenburn'
" Plugin 'altercation/vim-colors-solarized'

" Vim git-gutter
Plugin 'airblade/vim-gitgutter'

" Airline status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Editorconfig for Vim
Plugin 'editorconfig/editorconfig-vim'

" fugitive for working with Git
Plugin 'tpope/vim-fugitive'

" For Go code
Plugin 'fatih/vim-go'

" Better whitespace plugin
Plugin 'ntpeters/vim-better-whitespace'

" Move lines up and down with A-j and A-k
Plugin 'matze/vim-move'

" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'

" CSS syntax file
Plugin 'JulesWang/css.vim'

"
" Markdown
"

" Needed for the markdown plugin.
Plugin 'godlygeek/tabular'

" Markdown syntax plugin.
Plugin 'plasticboy/vim-markdown'

"
" NGINX
"

" NGINX syntax file
Plugin 'nginx.vim'

"
" JavaScript
"

" JavaScript indentation and syntax support.
Plugin 'pangloss/vim-javascript'

" JSX indentation and syntax support.
Plugin 'mxw/vim-jsx'

" The jshint plugin.
Plugin 'walm/jshint.vim'

"
" Clojure
"

" Fireplace the Clojure REPL for VIM.
Plugin 'tpope/vim-fireplace'

" vim clojure static
Plugin 'guns/vim-clojure-static'

"
" Fish
"
Plugin 'dag/vim-fish'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable color theme
set term=xterm-256color
syntax enable
set background=dark

colorscheme dracula
" colorscheme zenburn

" Set the maximum text width. The purpose is to wrap lines automatically.
set textwidth=80

" Needed for airline
" You also need to remember to install the powerline fonts.
" Instructions for this are in setup new machine.
" The font I like to use is 'Meslo LG S DZ'.
set laststatus=2
" Do not use the powerline fonts.
" let g:airline_powerline_fonts=1

" Use the solarized airline theme
" let g:ariline_theme='solarized'

" No backup files
set nobackup

" No swap files. We have enough memory
set noswapfile

" Turn off the startup message.
set shortmess+=I

" Open new splits on the right or below.
set splitbelow
set splitright

" Disable arrow keys in normal mode.
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Disable ex mode activation
noremap Q <Nop>

" Have jk and kj act as escape.
inoremap jk <Esc>
inoremap kj <Esc>

" Remove scrollbar in gui.
set guioptions-=r
set guioptions-=L

" Disable the bell.
set belloff=all

" Make backspace behave in a more sane manner.
set backspace=indent,eol,start

"
" Folding
"

" Make it so that files that are opened are fully unfolded.
set foldlevelstart=99

"
" Abbreviations
"

" Fix common typos
iabbr teh the

" Bookmark related
iabbr bmk {"text": "", "url": ""}<esc>12hi
iabbr bkm {"text": "", "url": ""}<esc>12hi
iabbr ctg {<CR>"category": "",<CR>"slug": "",<CR>"visibility": "public",<CR>"bookmarks": []<CR>},<esc>4kA

