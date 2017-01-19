let g:neomake_javascript_enabled_makers = ['eslint']
"Autofix on save
au BufWritePre *.js :Fixmyjs
au BufWritePre *.jsx :Fixmyjs
let g:fixmyjs_engine = 'eslint'
