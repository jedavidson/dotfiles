" Plugins {{{

call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
    Plug 'nanotech/jellybeans.vim'
    Plug 'chriskempson/base16-vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'airblade/vim-gitgutter'
    Plug 'voldikss/vim-floaterm'
call plug#end()

" }}}


" Colour scheme {{{

syntax on
set background=dark

colorscheme jellybeans

" }}}


" Basic settings {{{

" Set Space as leader
nnoremap <SPACE> <Nop>
let mapleader=" "

" Enable relative line numbering
set number relativenumber

" Show simple status bar
set laststatus=2

" Enable tab completion in command-mode menu
set wildmenu

" Highlight search results, display them incrementally and be case-insensitive
set hlsearch
set incsearch
set ignorecase

" Set indentation to 4 spaces, and replace every tab with spaces
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set shiftround
set autoindent
set copyindent

" Enable backspace in insert mode
set backspace=indent,eol,start

" Show every trailing whitespace
set lcs=trail:·
set list

" Show matching braces, parentheses etc.
set showmatch

" Highlight current line
set cursorline

" Reduce timeout that Vim waits for further input
set ttimeout
set ttimeoutlen=20
set timeoutlen=3000
set updatetime=300

" Disable file backups
set nobackup
set nowritebackup

" }}}


" Key remappings {{{

" Use U to redo
nnoremap U <C-R>

" Use Alt-[jk] to move the current line/selection up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" }}}

