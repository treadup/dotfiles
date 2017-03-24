"VIM configuration file

" A good place to find VIM plugins is the vimawesome.com site.

" The first thing we do is setup Vundle.
" The parts marked with 'required' are required
" for Vundle to work.
" https://github.com/VundleVim/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Solarized color theme
Plugin 'altercation/vim-colors-solarized'

" Vim git-gutter
Plugin 'airblade/vim-gitgutter'

" Airline status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Editorconfig for Vim
Plugin 'editorconfig/editorconfig-vim'

" NERDTree
Plugin 'scrooloose/nerdtree'

" fugitive for working with Git
Plugin 'tpope/vim-fugitive'

" Syntastic syntax checker for VIM.
" Plugin 'vim-syntastic/syntasti'

" Ag searching
Plugin 'mileszs/ack.vim'

" Better whitespace plugin
Plugin 'ntpeters/vim-better-whitespace'

" Move lines up and down with A-j and A-k
Plugin 'matze/vim-move'

" The vim easymotion plugin.
" This looks really interesting but I will not enable it for now.
" https://github.com/easymotion/vim-easymotion

" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'

" CSS syntax file
Plugin 'JulesWang/css.vim'

" Python virtualenv plugin for vim
" Plugin 'jmcantrell/vim-virtualenv'
" https://github.com/jmcantrell/vim-virtualenv

" NGINX syntax file
Plugin 'nginx.vim'

" The jshint plugin.
Plugin 'walm/jshint.vim'

" Mustache and Handlebars plugin.
Plugin 'mustache/vim-mustache-handlebars'

" Fireplace the Clojure REPL for VIM.
Plugin 'tpope/vim-fireplace'

" vim clojure static
Plugin 'guns/vim-clojure-static'

" Python jedi
" https://github.com/davidhalter/jedi
Plugin 'davidhalter/jedi'

" Python auto completion.
" https://github.com/davidhalter/jedi-vim
Plugin 'davidhalter/jedi-vim'

" You complete me
" http://valloric.github.io/YouCompleteMe/
" Plugin 'valloric/youcompleteme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable solarized color theme
set term=xterm-256color
syntax enable
set background=dark
colorscheme solarized

" Needed for airline
" You also need to remember to install the powerline fonts.
" Instructions for this are in setup new machine.
" The font I like to use is 'Meslo LG S DZ'.
set laststatus=2
" Do not use the powerline fonts.
" let g:airline_powerline_fonts=1

" Use the solarized airline theme
let g:ariline_theme='solarized'

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

" Automatically start NERDTree when you open a file.
" autocmd vimenter * NERDTree | wincmd p

" Use Ctrl-n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
map <F8> :NERDTreeToggle<CR>

" It would be nice if I could set up the following keybindings.
" Ctrl-h Jump to NERDTree
" Ctrl-l Jump to Viewer

" Quit VIM if NERDTree is the only open window left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Use ag for the ack VIM plugin.
let g:ackprg = 'ag --vimgrep'

" Remove scrollbar in gui.
set guioptions-=r
set guioptions-=L

" Make backspace behave in a more sane manner.
set backspace=indent,eol,start

