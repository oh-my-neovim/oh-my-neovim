## Oh My Neovim

Oh My Neovim is an open source for managing your [neovim](https://neovim.io/) configuration.

## Getting Started

### Prerequisites

- Unix-like operating system (macOS or Linux)
- Neovim should be installed, check the following instruction here: [Installing Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- `curl` or `wget` should be installed
- `git` should be installed
- optional install another font: https://github.com/ryanoasis/nerd-fonts#font-installation

### Basic Installation

Oh My Neovim is installed by running one of the following commands in your terminal. You can install this via the command-line with either `curl` or `wget`.

#### via curl

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/yacut/oh-my-neovim/master/tools/install.sh)"`

#### via wget

```shell
sh -c "$(wget https://raw.githubusercontent.com/yacut/oh-my-neovim/master/tools/install.sh -O -)"
```

> Do not forget to set the Nerd font in your terminal

## Using Oh My Neovim

#### Select Plugins

If you'd like to select plugins at any point in time you just need to run:

```shell
select_plugins_oh_my_neovim
```

#### Manual Updates

If you'd like to upgrade at any point in time (maybe someone just released a new plugin and you don't want to wait a week?) you just need to run:

```shell
upgrade_oh_my_neovim
```

### Recommendations

#### Get [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

#### Create dotfiles for a nodejs project

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/yacut/oh-my-neovim/master/templates/nodejs/create_dotfiles.sh)"`

#### Create dotfiles for a react project

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/yacut/oh-my-neovim/master/templates/react/create_dotfiles.sh)"`

## Uninstalling Oh My Neovim

If you want to uninstall `oh-my-neovim`, just run `uninstall_oh_my_neovim` from the command-line. It will remove itself and revert your previous `neovim` configuration.
