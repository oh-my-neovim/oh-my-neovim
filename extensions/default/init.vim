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
set list
set listchars=tab:➞\ ,nbsp:･,space:･
highlight NonText guifg=#657b83
highlight SpecialKey guifg=#657b83

let g:nerdtree_tabs_autofind=1
let g:NERDTreeShowHidden=1
set laststatus=2
" Do not open preview on completion
set completeopt-=preview

" SuperTab go from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"

" Airline settings
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#format = 1

" Leader guide settings
let g:leaderGuide_max_size = 20

let g:ale_fixers = {}
au BufNewFile,BufRead Jenkinsfile setf groovy

" Python provider
if has("nvim")
    let g:python_host_prog = $HOME . "/.pyenv/versions/neovim2/bin/python"
    let g:python3_host_prog = $HOME . "/.pyenv/versions/neovim3/bin/python"
endif

" Synchronize NERDTree with current opened file
"autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif

" Theme
if has("nvim")
  set termguicolors
endif

silent! colorscheme NeoSolarized
set background=dark

" dark mode enabled?
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin"
    if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
      set background=dark
    else
      set background=light
    endif
  endif
endif
