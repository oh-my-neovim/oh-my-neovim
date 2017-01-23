let s:menus = {}

let s:menus.git = {
    \ 'description' : 'git commands',
    \}
let s:menus.git.command_candidates = [
    \['git status       (Fugitive)                         ,gs',  'Gstatus'],
    \['git pull         (Fugitive)                         ,gpl', 'Gpull'],
    \['git push         (Fugitive)                         ,gps', 'Gpush'],
    \['git commit       (Fugitive)                         ,gc',  'Gcommit -v -q'],
    \['git diff         (Fugitive)                         ,gd',  'Gdiff'],
    \['git blame        (Fugitive)                         ,gbl', 'Gblame'],
    \['git branch       (Fugitive)                         ,gb',  'Git branch'],
    \['git checkout     (Fugitive)                         ,go',  'Git checkout'],
    \['git merge        (Fugitive)                         ,gm',  'Gmerge'],
    \['merginal                                            ,,m',  'MerginalToggle'],
    \['git log          (gitv)                             ,,v',  'Gitv'],
    \['git file history (gitv)                             ,,V',  'Gitv'],
    \]

let s:menus.javascript = {
    \ 'description' : 'javascript commands',
    \}
let s:menus.javascript.command_candidates = [
    \['beautify current file                               ,jb',  'call JsBeautify()'],
    \['go to definition        (tern)                      ,jd',  'TernDef'],
    \['find referencies        (tern)                      ,jr',  'TernRefs'],
    \['rename                  (tern)                      ,rn',  'TernRename'],
    \['show documentation      (tern)                      F1',   'TernRename'],
    \]

call denite#custom#var('menu', 'menus', s:menus)
