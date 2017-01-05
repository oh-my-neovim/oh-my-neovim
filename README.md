## My workspace scripts

### Upgrade vim config

##### Dependencies:
- https://github.com/neovim/neovim/wiki/Installing-Neovim
- install node npm editorconfig
- https://github.com/ryanoasis/nerd-fonts#font-installation
- npm install -g eslint jsonlint tern
- pip install yamllint ansible-lint

Upgrade .vimrc file in home directory:
`sh -c "$(curl -fsSL https://gist.githubusercontent.com/yacut/452f975be7fc37070c13651a329ddb90/raw)"`

### Setup new nodejs project

Create .editorconfig, .eslintrc and .tern-project files in current folder:
`sh -c "$(curl -fsSL https://gist.githubusercontent.com/yacut/7b11313234b76bed38b8b4dfc7a0ee24/raw)"`
