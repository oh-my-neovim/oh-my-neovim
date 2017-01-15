## Oh My Neovim

### Upgrade vim config

#### Dependencies:
- https://github.com/neovim/neovim/wiki/Installing-Neovim
- optional install another font: https://github.com/ryanoasis/nerd-fonts#font-installation

#### Install oh-my-neovim (Linux/MacOS):

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/yacut/oh-my-neovim/master/tools/install.sh)"`

#### Prepare workspace for oh-my-neovim (Linux/MacOS):

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/yacut/oh-my-neovim/master/tools/prepare_workspace.sh)"`

> Do not forget to set the "SauceCodePro NF" font and "Solarized Dark" color scheme in your terminal

**What the script does:**

- Get lastest [init.vim](https://github.com/yacut/oh-my-neovim/blob/master/init.vim)
- Check links for vim compatibility
- Install [nodejs](https://nodejs.org/en/download/package-manager/), [yarn](https://yarnpkg.com/en/docs/install), [editorconfig](http://editorconfig.org/), [ternjs](https://ternjs.net/), [eslint](http://eslint.org/), [jsonlint](http://jsonlint.com/), [yamllint](http://www.yamllint.com/), [ansible-lint](https://github.com/willthames/ansible-lint), [xmllint](http://xmlsoft.org/xmllint.html), [eslint-babel](https://github.com/babel/babel-eslint), python, python3, ruby, zsh
- Get latest Nerd Fonts: [Source Code Pro](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/font-info.md)
- Set [agnoster theme](https://github.com/robbyrussell/oh-my-zsh/wiki/Themes#agnoster) for zsh and activate [plugins](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins): git node npm yarn gulp docker docker-compose kubectl pip brew debian
- Upgrade Vim plugins
- Upgrade neovim providers
- Upgrade global npm packages with yarn

#### Upgrade oh-my-neovim and workspace (Linux/MacOS):

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/yacut/oh-my-neovim/master/tools/upgrade_workspace.sh)"`

### Recommendations

#### Get [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

#### Create dotfiles for a nodejs project

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/yacut/oh-my-neovim/master/templates/nodejs/create_dotfiles.sh)"`

#### Create dotfiles for a react project

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/yacut/oh-my-neovim/master/templates/react/create_dotfiles.sh)"`
