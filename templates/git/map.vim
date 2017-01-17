" Fugitive mapping
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gpl :Gpull<CR>
nnoremap <leader>gps :Gpush<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gbl :Gblame<CR>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gm :Gmerge<CR>
map <F11> [c " <F11> moves to previous change location
map <F12> ]c " <F12> moves to next change location

" Merginal
nmap <leader><leader>m :MerginalToggle<CR>

" Gitv
nmap <leader><leader>v :Gitv<CR>
nmap <leader><leader>V :Gitv!<CR>
vmap <leader><leader>V :Gitv!<CR>
