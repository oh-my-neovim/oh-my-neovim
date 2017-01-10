## My workspace

### Upgrade vim config

##### Dependencies:
- https://github.com/neovim/neovim/wiki/Installing-Neovim
- optional install another font: https://github.com/ryanoasis/nerd-fonts#font-installation

##### Upgrade workspace (Linux/MacOS):

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/yacut/workspace/master/upgrade_workspace.sh)"`

- Get lastest .vimrc
- Check links for neovim
- Upgrade Vim plugins
- Install nodejs, yarn, editorconfig, ternjs, eslint, jsonlint, yamllint, ansible-lint, xmllint, eslint-babel
- Get latest Nerd Fonts (Source Code Pro)

### Get ohmyzsh

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

#### Change to agnoster theme

`sed -i "s/ZSH_THEME=\".*/ZSH_THEME=\"agnoster\"/g" ~/.zshrc`

#### Add plugins

`sed -i "s/plugins=(.*/plugins=(git node npm yarn gulp docker docker-compose kubectl pip brew debian)/g" ~/.zshrc`

### Create dotfiles for a nodejs project

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/yacut/workspace/master/nodejs/create_dotfiles.sh)"`

### Create dotfiles for a react project

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/yacut/workspace/master/react/create_dotfiles.sh)"`
