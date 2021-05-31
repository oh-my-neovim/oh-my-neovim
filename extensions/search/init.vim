set wildignore+=**/node_modules/**
set wildignore+=**/*.log
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

set lazyredraw

if has('nvim-0.5')
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   highlight = {
"     enable = true
"   },
" }
" EOF
else
  let g:far#file_mask_favorites=['%', '**/*.*', '**/*.{ts,tsx}', '**/*.html', '**/*.{js,jsx}', '**/*.css', '**/*.go', '**/*.java','**/*.sh','**/*.tf']
  let g:webdevicons_enable_ctrlp = 1
  let g:esearch = {
    \ 'adapter':    'ag',
    \ 'backend':    'nvim',
    \ 'out':        'win',
    \ 'batch_size': 1000,
    \ 'use':        ['visual', 'hlsearch', 'last'],
    \}
endif

