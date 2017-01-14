" whitespace cleaning
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'far_vim', 'writable_search', 'vimfiler', 'vim-plug']
autocmd BufWritePre * StripWhitespace
