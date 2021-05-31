if has('nvim-0.5')
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'brooth/far.vim'
endif
