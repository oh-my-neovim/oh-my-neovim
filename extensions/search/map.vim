" nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader><s-o> :CtrlPCmdPalette<cr>
nnoremap <leader>p :FZF<cr>
" Start esearch prompt autofilled with one of g:esearch.use initial patterns
call esearch#map('<leader>ee', 'esearch')
" Start esearch autofilled with a word under the cursor
call esearch#map('<leader>ew', 'esearch-word-under-cursor')

" shortcut for far.vim find
nnoremap <silent> <leader><leader>f  :Farf<cr>
vnoremap <silent> <leader><leader>f  :Farf<cr>

" shortcut for far.vim replace
nnoremap <silent> <leader><leader>r  :Farr<cr>
vnoremap <silent> <leader><leader>r  :Farr<cr>
