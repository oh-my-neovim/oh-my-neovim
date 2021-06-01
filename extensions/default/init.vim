syntax on
let mapleader=','
let g:neosolarized_vertSplitBgTrans = 0
let g:gitgutter_override_sign_column_highlight = 0
set tabstop=4
set shiftwidth=4
set dir=~/.swap-files
set diffopt+=vertical
set clipboard+=unnamedplus
filetype indent on
set backspace=indent,eol,start
set list
set listchars=tab:➞\ ,nbsp:･,space:･
set redrawtime=10000
set regexpengine=0

set signcolumn=yes
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" let g:nerdtree_tabs_autofind=1
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=45

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
let $BAT_THEME='Solarized (dark)'

if has("mac")
  " ChangeBackground changes the background mode based on macOS's `Appearance`
  " setting. We also refresh the statusline colors to reflect the new mode.
  function! ChangeBackground()
    if system("defaults read -g AppleInterfaceStyle 2>/dev/null") =~ '^Dark'
      set background=dark   " for dark version of theme
      let $BAT_THEME='Solarized (dark)'
    else
      set background=light  " for light version of theme
      let $BAT_THEME='Solarized (light)'
    endif

    try
      execute "AirlineRefresh"
    catch
    endtry
  endfunction

  " initialize the colorscheme for the first run
  call ChangeBackground()

  augroup AutoChangeBackground
    autocmd!
    autocmd FocusGained,BufEnter * call ChangeBackground()
  augroup END

  " call timer_start(3000, "SyncDarkMode", {"repeat": -1})
endif

highlight NonText guifg=#657b83 ctermbg=NONE guibg=NONE
highlight SpecialKey guifg=#657b83 ctermbg=NONE guibg=NONE

" Workspace
let g:workspace_autosave_always = 1
let g:workspace_create_new_tabs = 0
if has("win64") || has("win32") || has("win16")
  let g:workspace_session_directory = $HOME . '/AppData/Local/nvim/sessions'
else
  let g:workspace_session_directory = $HOME . '/.config/nvim/sessions'
endif
let g:workspace_persist_undo_history = 1
let g:workspace_undodir= $HOME . '/.config/nvim/undo'
let g:workspace_autosave_ignore = ['gitcommit']
let g:workspace_session_disable_on_args = 1
