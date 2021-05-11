" nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader><s-o> :CtrlPCmdPalette<cr>
nnoremap <leader>p :FZF<cr>
" Start esearch prompt autofilled with one of g:esearch.use initial patterns
call esearch#map('<leader>ee', 'esearch')
" Start esearch autofilled with a word under the cursor
call esearch#map('<leader>ew', 'esearch-word-under-cursor')
