function! XMLBeautify()
    silent %!xmllint --format -
endfunction
autocmd FileType xml nnoremap <leader>jb :call XMLBeautify()<cr>
