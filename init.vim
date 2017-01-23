if (empty($OH_MY_NEOVIM))
  let oh_my_neovim=$HOME . '/.oh-my-neovim'
else
  let oh_my_neovim=$OH_MY_NEOVIM
endif

if (empty($OH_MY_NEOVIM_PLUGINS))
  let oh_my_neovim_plugins=[]
else
  let oh_my_neovim_plugins=split($OH_MY_NEOVIM_PLUGINS)
endif

if (empty($OH_MY_NEOVIM_MAPLEADER))
  let mapleader=','
else
  let mapleader=$OH_MY_NEOVIM_MAPLEADER
endif

call plug#begin('~/.local/share/nvim/plugged')

" Load oh-my-neovim plugins
for oh_my_neovim_plugin in oh_my_neovim_plugins
  if empty(glob(oh_my_neovim . '/plugins/' . oh_my_neovim_plugin . '/plug.vim')) == 0
    execute 'source' oh_my_neovim . '/plugins/' . oh_my_neovim_plugin . '/plug.vim'
  endif
endfor

" Load your custom plugins
if empty(glob($HOME . '/.config/nvim/custom.plug.vim')) == 0
  execute 'source' $HOME . '/.config/nvim/custom.plug.vim'
endif

call plug#end()

" Load oh-my-neovim configurations
for oh_my_neovim_plugin in oh_my_neovim_plugins
  if empty(glob(oh_my_neovim . '/plugins/' . oh_my_neovim_plugin . '/init.vim')) == 0
    execute 'source' oh_my_neovim . '/plugins/' . oh_my_neovim_plugin . '/init.vim'
  endif
endfor
" Load oh-my-neovim mapping
for oh_my_neovim_plugin in oh_my_neovim_plugins
  if empty(glob(oh_my_neovim . '/plugins/' . oh_my_neovim_plugin . '/map.vim')) == 0
    execute 'source' oh_my_neovim . '/plugins/' . oh_my_neovim_plugin . '/map.vim'
  endif
endfor

" Load your custom configuration
if empty(glob($HOME . '/.config/nvim/custom.init.vim')) == 0
  execute 'source' $HOME . '/.config/nvim/custom.init.vim'
endif
