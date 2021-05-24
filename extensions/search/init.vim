set wildignore+=**/node_modules/**
set wildignore+=**/*.log
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
let g:far#file_mask_favorites=['%', '**/*.*', '**/*.{ts,tsx}', '**/*.html', '**/*.{js,jsx}', '**/*.css', '**/*.go', '**/*.java','**/*.sh','**/*.tf']
let g:webdevicons_enable_ctrlp = 1
let g:esearch = {
  \ 'adapter':    'ag',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}

set lazyredraw            " improve scrolling performance when navigating through large results
