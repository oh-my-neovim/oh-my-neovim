## My workspace scripts

### Upgrade vim config

##### Dependencies:
- https://github.com/neovim/neovim/wiki/Installing-Neovim
- install node npm editorconfig
- https://github.com/ryanoasis/nerd-fonts#font-installation
- npm install -g eslint jsonlint tern
- pip install yamllint ansible-lint

##### Upgrade .vimrc file in home directory:

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/yacut/workspace/master/upgrade_vim_config.sh)"`


### Setup new nodejs project
##### Create .editorconfig, .eslintrc and .tern-project files in current folder:

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/yacut/workspace/master/create_config_files_for_nodejs_project.sh)"`
