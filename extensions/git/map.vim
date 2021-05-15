" Fugitive mapping
nnoremap <leader>gs :Gedit :<CR>
nnoremap <leader>gpl :Git pull<CR>
nnoremap <leader>gps :Git push<CR>
nnoremap <leader>gc :Git commit --signoff -v -q<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gbl :Git blame<CR>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gm :Git merge<CR>
map <F11> [c " <F11> moves to previous change location
map <F12> ]c " <F12> moves to next change location

" Merginal
nmap <leader><leader>m :MerginalToggle<CR>

" Gitv
nmap <leader><leader>v :Gitv<CR>
nmap <leader><leader>V :Gitv!<CR>
vmap <leader><leader>V :Gitv!<CR>
