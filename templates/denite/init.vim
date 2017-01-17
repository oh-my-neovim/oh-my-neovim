let s:menus = {}

let s:menus.git = {
    \ 'description' : 'git commands                    ⌘ ,g',
    \}
let s:menus.git.command_candidates = [
    \['git status       (Fugitive)                                ⌘ ,gs',  'Gstatus'],
    \['git pull         (Fugitive)                                ⌘ ,gpl', 'Gpull'],
    \['git push         (Fugitive)                                ⌘ ,gps', 'Gpush'],
    \['git commit       (Fugitive)                                ⌘ ,gc',  'Gcommit -v -q'],
    \['git diff         (Fugitive)                                ⌘ ,gd',  'Gdiff'],
    \['git blame        (Fugitive)                                ⌘ ,gbl', 'Gblame'],
    \['git branch       (Fugitive)                                ⌘ ,gb',  'Git branch'],
    \['git checkout     (Fugitive)                                ⌘ ,go',  'Git checkout'],
    \['git merge        (Fugitive)                                ⌘ ,gm',  'Gmerge'],
    \['merginal                                                   ⌘ ,,m',  'MerginalToggle'],
    \['git log          (gitv)                                    ⌘ ,,v',  'Gitv'],
    \['git file history (gitv)                                    ⌘ ,,V',  'Gitv'],
    \]
call denite#custom#var('menu', 'menus', s:menus)
