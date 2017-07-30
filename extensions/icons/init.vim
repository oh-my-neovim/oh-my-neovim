"NERDTree highlight
let s:blue = "689FB6"
let s:git_orange = 'F54D27'
let s:green = "8FAA54"
let s:red = "AE403F"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitignore'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitconfig'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['webpack.config.js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['node_modules'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.git'] = ''
let g:NERDTreeExactMatchHighlightColor = {}
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange
let g:NERDTreeExactMatchHighlightColor['.gitconfig'] = s:git_orange
let g:NERDTreeExactMatchHighlightColor['.git'] = s:git_orange
let g:NERDTreeExactMatchHighlightColor['webpack.config.js'] = s:blue
let g:NERDTreeExactMatchHighlightColor['node_modules'] = s:red
let g:NERDTreeExactMatchHighlightColor['test'] = s:green
let g:NERDTreeExactMatchHighlightColor['tests'] = s:green
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" Enable powerline font
let g:airline_powerline_fonts=1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
