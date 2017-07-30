syntax on
let mapleader=','
let g:neosolarized_vertSplitBgTrans = 0
let g:gitgutter_override_sign_column_highlight = 0
set number
set tabstop=4
set shiftwidth=4
set dir=~/.swap-files
set diffopt+=vertical
set clipboard+=unnamedplus
filetype indent on
set backspace=indent,eol,start

let g:nerdtree_tabs_autofind=1
let g:NERDTreeShowHidden=1
set laststatus=2
" Do not open preview on completion
set completeopt-=preview

" SuperTab go from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"

" Neomake check after open and write
autocmd! BufWritePost,BufEnter * silent! Neomake

" Airline settings
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#format = 1

" Leader guide settings
let g:leaderGuide_max_size = 20

let g:ale_fixers = {}
