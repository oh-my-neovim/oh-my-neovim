" Tree explorer
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Theme
Plug 'iCyMind/NeoSolarized'
Plug 'morhetz/gruvbox'

" Syntax
Plug 'sheerun/vim-polyglot'

" Display keymap
Plug 'hecal3/vim-leader-guide'

" Tab to completion
Plug 'ervandew/supertab'

" Linter
Plug 'dense-analysis/ale'

" vim-commentary
Plug 'tpope/vim-commentary'

" css colors highlight
Plug 'ap/vim-css-color'

" Maximizer
Plug 'szw/vim-maximizer'

if has('nvim-0.5')
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'
endif

" Workspace - undo and restore
Plug 'thaerkh/vim-workspace'
