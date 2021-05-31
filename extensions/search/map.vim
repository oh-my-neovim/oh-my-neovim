if has('nvim-0.5')
  " Find files using Telescope command-line sugar.
  nnoremap <leader><leader>f <cmd>Telescope live_grep<cr>
  nnoremap <leader><leader>r :lua require('spectre').open()<CR>
  "search current word
  nnoremap <leader>sw viw:lua require('spectre').open_visual()<CR>
  vnoremap <leader>s :lua require('spectre').open_visual()<CR>
else
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
endif

nnoremap <leader>p :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader><s-o> :Commands<cr>
