## My workspace

### Upgrade vim config

#### Dependencies:
- https://github.com/neovim/neovim/wiki/Installing-Neovim
- optional install another font: https://github.com/ryanoasis/nerd-fonts#font-installation

#### Upgrade workspace (Linux/MacOS):

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/yacut/workspace/master/upgrade_workspace.sh)"`

- Get lastest [.vimrc](https://github.com/yacut/workspace/blob/master/.vimrc)
- Check links for neovim
- Install nodejs, yarn, editorconfig, ternjs, eslint, jsonlint, yamllint, ansible-lint, xmllint, eslint-babel
- Get latest Nerd Fonts: [Source Code Pro](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/font-info.md)
- Get [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) if not installed
- Set [agnoster theme](https://github.com/robbyrussell/oh-my-zsh/wiki/Themes#agnoster) for zsh and activate [plugins](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins): git node npm yarn gulp docker docker-compose kubectl pip brew debian
- Upgrade Vim plugins

### Create dotfiles for a nodejs project

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/yacut/workspace/master/nodejs/create_dotfiles.sh)"`

### Create dotfiles for a react project

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/yacut/workspace/master/react/create_dotfiles.sh)"`
