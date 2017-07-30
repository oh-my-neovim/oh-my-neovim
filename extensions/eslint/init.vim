let g:neomake_javascript_enabled_makers = ['eslint_d']
"Autofix on save
au BufWritePre *.js :silent! Fixmyjs
au BufWritePre *.jsx :silent! Fixmyjs
let g:fixmyjs_engine = 'eslint'
let g:fixmyjs_rc_filename = ['.eslintrc', '.eslintrc.json', '.eslintrc.js']
