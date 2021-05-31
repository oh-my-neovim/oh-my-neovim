"" Vim session plugin does not work correctly, so use custom script
" let g:session_default_name = substitute(getcwd(), "\/", "_", "g")
" let g:session_autosave = 'yes'
" let g:session_autosave_periodic = 5
" let g:session_autosave_to = 'default'
" let g:session_autoload = 'yes'
" let g:session_verbose_messages = 0

function! GetSessFile()
    if has("win64") || has("win32") || has("win16")
        let sess_dir = '~/AppData/Local/nvim/sessions'
    else
        let sess_dir = '~/.config/nvim/sessions'
    endif
    return sess_dir . substitute(getcwd(), "\/", "_", "g") . '_session.vim'
endfunction

function! SaveSess()
    let sess_file = GetSessFile()
    silent! execute 'tabdo NERDTreeClose'
    silent! execute 'mksession! ' sess_file
endfunction

function! RestoreSess()
    let sess_file = GetSessFile()
    silent! execute 'source ' sess_file
    if bufexists(1)
        for l in range(1, bufnr('$'))
            if bufwinnr(l) == -1
                silent! execute 'sbuffer ' . l
            endif
        endfor
    endif
endfunction

autocmd VimLeave * silent! call SaveSess()
autocmd VimEnter * silent! call RestoreSess()
