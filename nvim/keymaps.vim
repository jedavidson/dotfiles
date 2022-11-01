" Set Space as leader
nnoremap <SPACE> <Nop>
let mapleader=" "

" Use U to redo
nnoremap U <C-R>

" Use Alt-[jk] to move the current line/selection up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
