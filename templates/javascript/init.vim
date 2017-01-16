let g:deoplete#enable_at_startup = 1
let g:tern_show_signature_in_pum = 1
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:tern_request_timeout = 1
set completeopt-=preview
let g:neomake_javascript_enabled_makers = ['eslint']
"Autofix on save
au BufWritePre *.js :Fixmyjs
au BufWritePre *.jsx :Fixmyjs
let g:fixmyjs_engine = 'eslint'

set foldmethod=syntax
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1
set foldlevelstart=99
set foldlevel=99
set nofoldenable
