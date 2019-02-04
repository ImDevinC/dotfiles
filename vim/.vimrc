syntax on
set modelines=1
" Tab options {{{
set tabstop=4		" Number of visual spaces per tab
set softtabstop=4	" Number of spaces in tabs when editing
set expandtab		" Tabs are spaces
" }}}
" UI options {{{
set number		" Show line numbers
set showcmd		" Shows most recent command
set cursorline		" Hilights the current line
set wildmenu		" Autocomplete for menu
set lazyredraw		" Only redraw when necessary
set showmatch		" Hilight matching brackets
" }}}
" Search settings {{{
set incsearch		" Search as characters are typed
set hlsearch		" Hilight matches
" }}}
" Folding {{{
set foldenable		" Enable folding
set foldlevelstart=10	" Open folds up to 10 by default
set foldnestmax=10	" 10 max folds
set foldmethod=indent	" Fold based on indent level
" Space open/closes folds
nnoremap <space> za
" }}}
" vim:foldmethod=marker:foldlevel=0
