## Oh My Neovim

Oh My Neovim is an open source for managing your [Neovim](https://neovim.io/) configurations, plugins and dependencies for it.

### Motivation

One of the big problems of [Neovim](https://neovim.io/) is to find right plugins, if you want more features for your text editor. In addition you have to install all dependencies and configure plugins correctly. Of course you can find everything on the Internet, but that costs your time. And you just want to use your text editor.
Another issue is if you lost your configuration, you have to search again the plugins, install the dependencies and configure it.
One more thing can be that you do not even know that you can improve your text editor.

### Solution

Oh My Neovim is a project that has the following goals:

- Simplify the installation process of plugins and its dependencies
- Simplify the configuration overhead
- Build a big library that helps users to get batch of features for the [Neovim](https://neovim.io/) with just one command

## Getting Started

### Prerequisites

- Unix-like operating system (macOS or Linux)
- Neovim should be installed, check the following instruction here: [Installing Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- `curl` should be installed
- `git` should be installed
- optional install another font: https://github.com/ryanoasis/nerd-fonts#font-installation

### Basic Installation

Oh My Neovim is installed by running one of the following commands in your terminal. You can install this via the command-line with `curl`.

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/oh-my-neovim/oh-my-neovim/master/tools/install.sh)"
```
> Do not forget to set the Nerd font in your terminal

## Using Oh My Neovim

#### Select [Extensions](extensions)

If you'd like to select extensions at any point in time you just need to run:

```shell
select_extensions_oh_my_neovim
```

#### Manual Updates

If you'd like to upgrade at any point in time you just need to run:

```shell
upgrade_oh_my_neovim
```

#### Advanced

##### Leader key

The default <leader> key is ',' (comma). If you'd like to set another you need to add the OH_MY_NEOVIM_MAPLEADER environment variable to your shell profile. For example set <leader> to <space>:

```shell
OH_MY_NEOVIM_MAPLEADER="\<Space>"
```

### Recommendations

#### Get [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

#### Create dotfiles for a nodejs project

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/oh-my-neovim/oh-my-neovim/master/extensions/nodejs/create_dotfiles.sh)"`

#### Create dotfiles for a react project

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/oh-my-neovim/oh-my-neovim/master/extensions/react/create_dotfiles.sh)"`

## Uninstalling Oh My Neovim

If you want to uninstall `oh-my-neovim`, just run `uninstall_oh_my_neovim` from the command-line. It will remove itself and revert your previous [Neovim](https://neovim.io/) configuration.

## Self-Promotion

Like Oh My Neovim? Follow the repository on [https://github.com/oh-my-neovim/oh-my-neovim](https://github.com/oh-my-neovim/oh-my-neovim) and vote for it.

## Credits

I would like to thank [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) project, from which I borrowed install/upgrade/uninstall processes and another good ideas.

## License

Oh My Neovim is released under the [MIT license](LICENSE).
