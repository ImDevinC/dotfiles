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
" Plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'sheerun/vim-polyglot'
Plug 'hashivim/vim-terraform'
call plug#end()
let g:terraform_fmt_on_save=1
" }}}
" Theme {{{
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
set laststatus=2
set background=dark
let g:lightline = {'colorscheme': 'palenight'}
syntax on
colorscheme palenight
" }}}
" vim:foldmethod=marker:foldlevel=0
