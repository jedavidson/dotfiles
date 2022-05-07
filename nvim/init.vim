" Plugins {{{
call plug#begin('~/.vim/plugged')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'jiangmiao/auto-pairs'
call plug#end()

" }}}


" Colour scheme {{{

"set termguicolors
if !has('gui_running')
    set t_Co=256
endif

" Treesitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" }}}


" Basic settings {{{

" Enable relative line numbering
set number relativenumber

" Enable tab completion in command-mode menu
set wildmenu

" Highlight search results, display them incrementally and be case-insensitive
set hlsearch incsearch ignorecase

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

" Reduce timeout that Vim waits for further input
set ttimeout
set ttimeoutlen=20
set timeoutlen=3000
set updatetime=300

" Enable buffers? Done by recommendation of coc.nvim
set hidden

" Disable file backups
set nobackup nowritebackup

" ??? Another thing that coc.nvim recommended
set shortmess+=c

" }}}


" Key remappings {{{

" Use Space as leader
nnoremap <SPACE> <Nop>
let mapleader=" "

" Use Alt+[jk] to move the current line/selection up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" }}}
