if (empty($OH_MY_NEOVIM))
  let oh_my_neovim=$HOME . '/.oh-my-neovim'
else
  let oh_my_neovim=$OH_MY_NEOVIM
endif

if (empty($OH_MY_NEOVIM_EXTENSIONS))
  let oh_my_neovim_extensions=[]
else
  let oh_my_neovim_extensions=split($OH_MY_NEOVIM_EXTENSIONS)
endif

call plug#begin('~/.local/share/nvim/plugged')

" Load oh-my-neovim extensions
for oh_my_neovim_extension in oh_my_neovim_extensions
  if empty(glob(oh_my_neovim . '/extensions/' . oh_my_neovim_extension . '/plug.vim')) == 0
    execute 'source' oh_my_neovim . '/extensions/' . oh_my_neovim_extension . '/plug.vim'
  endif
endfor

" Load your custom extensions
if empty(glob($HOME . '/.config/nvim/custom.plug.vim')) == 0
  execute 'source' $HOME . '/.config/nvim/custom.plug.vim'
endif

call plug#end()

" Load oh-my-neovim configurations
for oh_my_neovim_extension in oh_my_neovim_extensions
  if empty(glob(oh_my_neovim . '/extensions/' . oh_my_neovim_extension . '/init.vim')) == 0
    execute 'source' oh_my_neovim . '/extensions/' . oh_my_neovim_extension . '/init.vim'
  endif
endfor
" Load oh-my-neovim mapping
for oh_my_neovim_extension in oh_my_neovim_extensions
  if empty(glob(oh_my_neovim . '/extensions/' . oh_my_neovim_extension . '/map.vim')) == 0
    execute 'source' oh_my_neovim . '/extensions/' . oh_my_neovim_extension . '/map.vim'
  endif
endfor

" Load your custom configuration
if empty(glob($HOME . '/.config/nvim/custom.init.vim')) == 0
  execute 'source' $HOME . '/.config/nvim/custom.init.vim'
endif

if (empty($OH_MY_NEOVIM_MAPLEADER))
  let mapleader=','
else
  let mapleader=$OH_MY_NEOVIM_MAPLEADER
endif

