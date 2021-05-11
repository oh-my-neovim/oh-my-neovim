" Change background
map <F5> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
" NERDTree settings
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader><leader>f :NERDTreeFind<CR>

command! Cnext try | cnext | catch | cfirst | catch | endtry
command! Cprev try | cprev | catch | clast | catch | endtry
command! Lnext try | lnext | catch | lfirst | catch | endtry
command! Lprev try | lprev | catch | llast | catch | endtry
nnoremap <leader>n :Cnext<CR>
nnoremap <leader>l :Lnext<CR>
nnoremap <leader>+ :vertical resize +5<cr>
nnoremap <leader>- :vertical resize -5<cr>
nnoremap <leader><leader>+ :resize +5<cr>
nnoremap <leader><leader>- :resize -5<cr>
nnoremap <leader><space> :noh<cr>

" Buffers
nnoremap <leader>T :enew<cr>
nnoremap by :bnext<CR>
nnoremap bt :bprevious<cr>
nnoremap bd :bdelete<cr>
nnoremap bo :BufOnly<cr>
nnoremap <leader>q :q<CR>

" Press Enter on completion does a new line
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Move line up and down
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

" Encode/Decode base64
vnoremap <leader>64e c<c-r>=system('base64',@")<cr><esc>
vnoremap <leader>64d c<c-r>=system('base64 --decode',@")<cr><esc>

"Leader guide
map <leader>. <Plug>leaderguide-global
nnoremap <silent> <leader> :<c-u>LeaderGuide ','<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual ','<CR>
