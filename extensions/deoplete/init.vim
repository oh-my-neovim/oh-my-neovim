let g:deoplete#enable_at_startup = 1
" https://github.com/zchee/deoplete-clang#available-settings

" https://github.com/zchee/deoplete-go#available-settings
"let g:deoplete#sources#go#gocode_binary=''
"let g:deoplete#sources#go#sort_class=[]
"let g:deoplete#sources#go#use_cache=0
"let g:deoplete#sources#go#json_directory=''

let g:tern_show_signature_in_pum = 1
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:tern_request_timeout = 1

set foldmethod=syntax
let g:javascript_plugin_jsdoc = 1
set foldlevelstart=99
set foldlevel=99
set nofoldenable
