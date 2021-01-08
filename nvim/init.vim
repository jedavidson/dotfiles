" Plugins
call plug#begin('~/.vim/plugged')
    Plug 'itchyny/lightline.vim'
    Plug 'morhetz/gruvbox'
call plug#end()

" Colour scheme
set termguicolors
if !has('gui_running')
  set t_Co=256
endif
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" Basic settings
syntax on
set background=dark
set number relativenumber
set wildmenu
set hlsearch
set incsearch
set ignorecase
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set shiftround
set backspace=indent,eol,start
set autoindent
set copyindent
set lcs=trail:·
set list
set showmatch
set cursorline
set laststatus=2

