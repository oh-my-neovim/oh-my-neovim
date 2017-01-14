if (empty($OH_MY_NEOVIM))
  let oh_my_neovim=~/.oh-my-neovim
else
  let oh_my_neovim=$OH_MY_NEOVIM
endif
if (empty($OH_MY_NEOVIM))
  let oh_my_neovim_plugins=[]
else
  let oh_my_neovim_plugins=split($OH_MY_NEOVIM_PLUGINS)
endif

call plug#begin('~/.vim/plugged')

" Your plugins can be load here
Plug 'terryma/vim-multiple-cursors'
Plug 'YankRing.vim'
Plug 'sjl/gundo.vim'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'BufOnly.vim'

" Load oh-my-neovim plugins
for oh_my_neovim_plugin in oh_my_neovim_plugins
  if empty(glob(oh_my_neovim . '/templates/' . oh_my_neovim_plugin . '/plug.vim')) == 0
    execute 'source' oh_my_neovim . '/templates/' . oh_my_neovim_plugin . '/plug.vim'
  endif
endfor

call plug#end()

" Load oh-my-neovim configurations
for oh_my_neovim_plugin in oh_my_neovim_plugins
  if empty(glob(oh_my_neovim . '/templates/' . oh_my_neovim_plugin . '/init.vim')) == 0
    execute 'source' oh_my_neovim . '/templates/' . oh_my_neovim_plugin . '/init.vim'
  endif
endfor
" Load oh-my-neovim mapping
for oh_my_neovim_plugin in oh_my_neovim_plugins
  if empty(glob(oh_my_neovim . '/templates/' . oh_my_neovim_plugin . '/init.vim')) == 0
    execute 'source' oh_my_neovim . '/templates/' . oh_my_neovim_plugin . '/init.vim'
  endif
endfor

" YOU CAN YOUR SETTINGS BELOW
nnoremap <leader>q :q<CR>
nnoremap <leader><leader>o :BufOnly<cr>

" Multi cursor setting
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" Save file after lost focus
au FocusLost * :wa

" tagbar
nmap <F8> :TagbarToggle<CR>

