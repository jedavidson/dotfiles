if !exists('g:vscode')
    " Plugins {{{

    call plug#begin('~/.vim/plugged')
        Plug 'itchyny/lightline.vim'
        Plug 'morhetz/gruvbox'
        Plug 'chriskempson/base16-vim'
        Plug 'sheerun/vim-polyglot'
        Plug 'airblade/vim-gitgutter'
        Plug 'voldikss/vim-floaterm'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
    call plug#end()

    " }}}


    " Colour scheme {{{

    set termguicolors
    if !has('gui_running')
      set t_Co=256
    endif
    let g:gruvbox_contrast_dark='hard'
    colorscheme gruvbox

    " }}}


    " Basic settings {{{

    " Set Space as leader
    nnoremap <SPACE> <Nop>
    let mapleader=" "

    " Enable syntax highlighting
    syntax on
    set background=dark

    " Enable relative line numbering
    set number relativenumber

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
    " This is done by recommendation of coc.nvim, and also speeds up going from
    " visual mode to normal mode for some reason /shrug
    set ttimeout
    set ttimeoutlen=20
    set timeoutlen=3000
    set updatetime=300

    " Enable buffers? Done by recommendation of coc.nvim
    set hidden

    " Disable file backups
    set nobackup
    set nowritebackup

    " ??? Another thing that coc.nvim recommended
    set shortmess+=c

    " }}}


    " Key remappings {{{

    " Use Alt-[jk] to move the current line/selection up or down
    nnoremap <A-j> :m .+1<CR>==
    nnoremap <A-k> :m .-2<CR>==
    inoremap <A-j> <Esc>:m .+1<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv

    " }}}


    " coc-nvim configuration {{{

    " Show sign column for language server warnings/error indicators
    if has("patch-8.1.1564")
      set signcolumn=number
    else
      set signcolumn=yes
    endif

    " Use tab to trigger completion with characters ahead and navigating suggestions
    inoremap <silent><expr> <TAB>
          \ <SID>check_back_space() ? "\<TAB>" :
          \ pumvisible() ? "\<C-n>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use Cmd-Space to manually trigger completion
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Make Enter auto-select the first completion item and format
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " Code navigation bindings:
    " - gd -> go to definition
    " - gy -> go to type definition
    " - gi -> go to implementation
    " - gr -> go to references
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gt <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction

    " Highlight symbol and its references when holding the cursor (?)
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Use Space-rn to rename symbol
    nmap <leader>rn <Plug>(coc-rename)

    " Format selected code
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
    augroup mygroup
      autocmd!
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Make :Format command to format the current file
    command! -nargs=0 Format :call CocAction('format')

    " Make :Fold command to fold levels (?) of the current file
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Make :OR command to organise imports in the current file
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Enable coc.nvim integration into lightline
    let g:lightline = {
        \ 'colorscheme': 'powerline',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'cocstatus': 'coc#status'
        \ },
        \ }
    autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

    " }}}
endif
