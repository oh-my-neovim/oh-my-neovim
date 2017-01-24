autocmd FileType javascript nnoremap <leader>jb :call JsBeautify()<cr>
autocmd FileType javascript nnoremap <leader>jd :TernDef<cr>
autocmd FileType javascript nnoremap <leader>jr :TernRefs<cr>
autocmd FileType javascript nnoremap <leader>jn :TernRename<cr>
autocmd FileType javascript nnoremap <leader>jt :TernType<cr>
autocmd FileType javascript inoremap <F1> :TernDocBrowse<cr>
autocmd FileType javascript nnoremap <F1> :TernDocBrowse<cr>
inoremap <expr> <C-Space> deoplete#manual_complete()
