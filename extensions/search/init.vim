set wildignore+=**/node_modules/**
set wildignore+=**/*.log
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
if has("nvim")
  let g:far#source = 'agnvim'
else
  let g:far#source = 'ag'
endif
let g:far#ignore_files=['.git/*', '*.pyc', '__pycache__/*', '*/node_modules/*']
let g:far#file_mask_favorites=['%', '**/*.*', '**/*.ts?x', '**/*.html', '**/*.js', '**/*.css', '**/*.go', '**/*.java']
let g:webdevicons_enable_ctrlp = 1
let g:esearch = {
  \ 'adapter':    'ag',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}

set lazyredraw            " improve scrolling performance when navigating through large results
