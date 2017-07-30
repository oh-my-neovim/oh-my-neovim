let g:neomake_javascript_enabled_makers = ['eslint_d']
"Autofix on save
au BufWritePre *.js :silent! ALEFix
au BufWritePre *.jsx :silent! ALEFix
let g:ale_fixers.javascript = ['eslint']
