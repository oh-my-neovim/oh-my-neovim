if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
let g:neosolarized_vertSplitBgTrans = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
silent! colorscheme NeoSolarized
set number
set tabstop=4
set shiftwidth=4
set expandtab
set noswapfile
set diffopt+=vertical
set spell spelllang=en_us
set lazyredraw
set noshowmode
set clipboard+=unnamedplus
filetype indent on
set backspace=indent,eol,start

let g:nerdtree_tabs_autofind=1
let g:NERDTreeShowHidden=1
set laststatus=2

" Neomake check after open and write
autocmd! BufWritePost,BufEnter * silent! Neomake

" Airline settings
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#format = 1

" Leader guide settings
" call leaderGuide#register_prefix_descriptions(",", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide ','<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual ','<CR>
