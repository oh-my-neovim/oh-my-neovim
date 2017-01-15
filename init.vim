if (empty($OH_MY_NEOVIM))
  let oh_my_neovim=$HOME . '/.oh-my-neovim'
else
  let oh_my_neovim=$OH_MY_NEOVIM
endif
if (empty($OH_MY_NEOVIM))
  let oh_my_neovim_plugins=[]
else
  let oh_my_neovim_plugins=split($OH_MY_NEOVIM_PLUGINS)
endif

call plug#begin('~/.vim/plugged')

" Your plugins below
" Plug 'sjl/gundo.vim' " Example

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
  if empty(glob(oh_my_neovim . '/templates/' . oh_my_neovim_plugin . '/map.vim')) == 0
    execute 'source' oh_my_neovim . '/templates/' . oh_my_neovim_plugin . '/map.vim'
  endif
endfor

" Your settings below
let mapleader = ','

set background=dark
colorscheme NeoSolarized
set encoding=utf-8
set langmenu=en_US
let $LANG = 'en_US'
set guifont=SauceCodePro\ Nerd\ Font:h13
