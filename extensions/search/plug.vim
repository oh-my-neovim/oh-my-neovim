if has('nvim-0.5')
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-spectre'
else
  " search and replace
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'sgur/ctrlp-extensions.vim'
  Plug 'fisadev/vim-ctrlp-cmdpalette'
  Plug 'rking/ag.vim'
  Plug 'taiansu/nerdtree-ag'
  Plug 'eugen0329/vim-esearch'
  Plug 'https://github.com/will133/vim-dirdiff.git'
  Plug 'brooth/far.vim'
endif

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
