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
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
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
" Do not open preview on completion
set completeopt-=preview

" SuperTab go from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"

" Neomake check after open and write
autocmd! BufWritePost,BufEnter * silent! Neomake

" Airline settings
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#format = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

" Leader guide settings
let g:leaderGuide_max_size = 20

"NERDTree highlight
let s:blue = "689FB6"
let s:git_orange = 'F54D27'
let s:green = "8FAA54"
let s:red = "AE403F"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitignore'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitconfig'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['webpack.config.js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['node_modules'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.git'] = ''
let g:NERDTreeExactMatchHighlightColor = {}
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange
let g:NERDTreeExactMatchHighlightColor['.gitconfig'] = s:git_orange
let g:NERDTreeExactMatchHighlightColor['.git'] = s:git_orange
let g:NERDTreeExactMatchHighlightColor['webpack.config.js'] = s:blue
let g:NERDTreeExactMatchHighlightColor['node_modules'] = s:red
let g:NERDTreeExactMatchHighlightColor['test'] = s:green
let g:NERDTreeExactMatchHighlightColor['tests'] = s:green
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
