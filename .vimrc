" ~/.vimrc

" Dependencies:
" 1) install node npm editorconfig
" 2) https://github.com/ryanoasis/nerd-fonts#font-installation
" 3) npm install -g eslint jsonlint tern
" 4) pip install yamllint ansible-lint
" 5) https://github.com/ggreer/the_silver_searcher#installing
" 6) optional ack package: http://beyondgrep.com/install/
"
" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" interface and themes
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'

" search and replace
Plug 'L9'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'taiansu/nerdtree-ag'
Plug 'brooth/far.vim'
Plug 'eugen0329/vim-esearch'
Plug 'https://github.com/will133/vim-dirdiff.git'

" tooling
Plug 'xolox/vim-misc'
Plug 'terryma/vim-multiple-cursors'
Plug 'xolox/vim-session'
Plug 'YankRing.vim'
Plug 'sjl/gundo.vim'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'BufOnly.vim'
Plug 'ntpeters/vim-better-whitespace'

" coding style
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'

" git integration
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
Plug 'xuyuanp/nerdtree-git-plugin'

" specific syntax
Plug 'markcornick/vim-vagrant'
Plug 'chase/vim-ansible-yaml'
Plug 'tpope/vim-markdown'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'ekalinin/dockerfile.vim'

" syntax checkers
Plug 'benekastah/neomake'

" python
Plug 'zchee/deoplete-jedi'

" java
Plug 'artur-shaik/vim-javacomplete2'
Plug 'derekwyatt/vim-scala'

" javascript and nodejs
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs', {'do': 'cd ~/.vim && npm install tern@latest'}
Plug 'heavenshell/vim-jsdoc'
Plug 'maksimr/vim-jsbeautify'
Plug 'ruanyl/vim-fixmyjs'

" json
Plug 'elzr/vim-json'

" react
Plug 'mxw/vim-jsx'

" typescript
Plug 'leafgarland/typescript-vim'

" go
Plug 'fatih/vim-go'

" webdevicons must be loaded last
Plug 'ryanoasis/vim-devicons'
call plug#end()

" for javascript
let g:deoplete#enable_at_startup = 1
let g:tern_show_signature_in_pum = 1
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:tern_request_timeout = 120
set completeopt-=preview

" whitespace cleaning
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'far_vim', 'writable_search', 'vimfiler', 'vim-plug']
autocmd BufWritePre * StripWhitespace

" Highlight settings
syntax on
set background=light
"let g:solarized_termcolors=256
"set t_Co=256
let g:neosolarized_vertSplitBgTrans = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
colorscheme NeoSolarized

" System settings
let mapleader = ','
set encoding=utf-8
set langmenu=en_US
let $LANG = 'en_US'
set guifont=SauceCodePro\ Nerd\ Font:h13
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
command! Cnext try | cnext | catch | cfirst | catch | endtry
command! Cprev try | cprev | catch | clast | catch | endtry
command! Lnext try | lnext | catch | lfirst | catch | endtry
command! Lprev try | lprev | catch | llast | catch | endtry
nnoremap <leader>n :Cnext<CR>
nnoremap <leader>p :Cprev<CR>
nnoremap <leader>l :Lnext<CR>
nnoremap <leader>+ :vertical resize +5<cr>
nnoremap <leader>- :vertical resize -5<cr>
nnoremap <leader><leader>+ :resize +5<cr>
nnoremap <leader><leader>- :resize -5<cr>
set backspace=indent,eol,start

" Press Enter on completion does a new line
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
vnoremap <leader>64e c<c-r>=system('base64',@")<cr><esc>
vnoremap <leader>64d c<c-r>=system('base64 --decode',@")<cr><esc>

" Search settings
set wildignore+=**/node_modules/**
set wildignore+=**/*.log
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
let g:far#source = 'agnvim'

nnoremap <leader><space> :noh<cr>
nnoremap <leader>q :q<CR>

" JSON
let g:vim_json_syntax_conceal = 0

" Neomake
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_yaml_enabled_makers = ['yamllint']
let g:neomake_ansible_enabled_makers = ['ansible-lint']
let g:neomake_css_enabled_makers = ['csslint']
"let g:neomake_verbose = 3

" youcompleteme
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_allow_changing_updatetime = 0

" Command T settings
let g:CommandTInputDebounce = 200
let g:CommandTFileScanner = "watchman"
let g:CommandTWildIgnore = &wildignore . ",**/bower_components/*" . ",**/node_modules/*" . ",**/vendor/*" . ",**/*.log"
let g:CommandTMaxHeight = 30
let g:CommandTMaxFiles = 500000

" Ctrlp
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

" JS helpers
autocmd FileType javascript nnoremap <leader>jb :call JsBeautify()<cr>
autocmd FileType json nnoremap <leader>jb :call JsonBeautify()<cr>
autocmd FileType jsx nnoremap <leader>jb :call JsxBeautify()<cr>
autocmd FileType javascript nnoremap <leader>jd :TernDef<cr>
autocmd FileType javascript nnoremap <leader>jr :TernRefs<cr>
autocmd FileType javascript nnoremap <leader>rn :TernRename<cr>
autocmd FileType javascript inoremap <F1> :TernType<cr>
autocmd FileType javascript nnoremap <F1> :TernType<cr>

" Buffers
nnoremap <leader>T :enew<cr>
nnoremap gy :bnext<CR>
nnoremap gt :bprevious<cr>
nnoremap gd :bdelete<cr>
nnoremap <leader><leader>o :BufOnly<cr>

" NERD settings
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
let g:nerdtree_tabs_autofind=1
let g:NERDTreeShowHidden=1
"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd p
set laststatus=2

" Airline settings
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#format = 1

" GitGutter
let g:gitgutter_override_sign_column_highlight = 0

" Gitv
cabbrev gitv Gitv
let g:Gitv_OpenHorizontal = 1
let g:Gitv_WrapLines = 1
nmap <leader><leader>v :Gitv<CR>
nmap <leader><leader>V :Gitv!<CR>
vmap <leader><leader>V :Gitv!<CR>

" Merginal
nmap <leader><leader>m :MerginalToggle<CR>

"Autofix on save
au BufWritePre *.js :Fixmyjs
au BufWritePre *.jsx :Fixmyjs
let g:fixmyjs_engine = 'eslint'

" Move line up and down
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

" Javascript settings
set foldmethod=syntax
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1
set foldlevelstart=99
"set foldcolumn=2
set foldlevel=99
set nofoldenable

" Multi cursor setting
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" Save file after lost focus
au FocusLost * :wa

" fugitive git bindings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Gpush<CR>
nnoremap <leader>gpl :Gpull<CR>
nnoremap <leader>gm :Gmerge<CR>
" <F11> moves to previous change location,
" <F12> moves to next change location,
map <F11> [c
map <F12> ]c

" Do not use Editor config with remote files
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" tagbar
nmap <F8> :TagbarToggle<CR>

" Session
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 5
let g:session_autoload = 'yes'

" XML
function! XMLBeautify()
    silent %!xmllint --format -
endfunction
autocmd FileType xml nnoremap <leader>jb :call XMLBeautify()<cr>

"Javacomplete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
