let g:neomake_javascript_enabled_makers = ['eslint']
"Autofix on save
au BufWritePre *.js :silent! Fixmyjs
au BufWritePre *.jsx :silent! Fixmyjs
let g:fixmyjs_engine = 'eslint'
