## Oh My Neovim

Oh My Neovim is an open source toolkit for managing your [Neovim](https://neovim.io/) configurations, plugins and dependencies for it.

### Motivation

One of the big problems of [Neovim](https://neovim.io/) is to find right plugins, if you want more features for your text editor. In addition you have to install all dependencies and configure plugins correctly.

For example [deoplete](https://github.com/Shougo/deoplete.nvim) is great project, but you do not know whether your desired programming language supported and if you want use it you need to understand how to install and configure it. Of course you can find everything on the Internet, but that costs your time. And you just want to use your text editor.

Another issue is if you lost your configuration, you have to search again the plugins, install the dependencies and configure it.

One more thing can be that you do not even know that you can improve your text editor.

### Solution

Oh My Neovim is a project that has the following goals:

- Simplify the installation process of plugins and its dependencies (e.g. the [default extension](https://github.com/oh-my-neovim/oh-my-neovim/tree/master/extensions/default) will install all Neovim dependencies)
- Simplify the configuration overhead
- Build a big extensions library that helps users to get batch of features for the [Neovim](https://neovim.io/) with just one command

## Getting Started

### Prerequisites

- Unix-like operating system (macOS or Linux)
- `curl` should be installed
- `git` should be installed

### Basic Installation

Oh My Neovim is installed by running one of the following commands in your terminal. You can install this via the command-line with `curl`.

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/oh-my-neovim/oh-my-neovim/master/tools/install.sh)"
```

> Do not forget to set the [Nerd font](https://github.com/ryanoasis/nerd-fonts#font-installation) in your terminal

## Using Oh My Neovim

#### Select [Extensions](extensions)

If you'd like to select extensions at any point in time you just need to run:

```shell
select_extensions_oh_my_neovim
```

> extension set example: `export OH_MY_NEOVIM_EXTENSIONS="default ansible clang code_style coffee denite eslint git go icons java javascript json motion nodejs python react ruby search session snippet spell sublime test themes typescript undo vim web xml yaml mouse"`

#### Manual Updates

If you'd like to upgrade at any point in time you just need to run:

```shell
upgrade_oh_my_neovim
```

#### Advanced

##### Custom configurations

The installation process will create `~/.config/nvim/custom.plug.vim` and `~/.config/nvim/custom.init.vim` files which you can use to add your own plugins and configurations accordingly.

For example to set another colorscheme:

```shell
echo "\ncolorscheme monokai" >> ~/.config/nvim/custom.init.vim
```

### Recommendations

#### Get [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

##### Use search in zsh with fzf

brew install fzf && /usr/local/opt/fzf/install

## Uninstalling Oh My Neovim

If you want to uninstall `oh-my-neovim`, just run `uninstall_oh_my_neovim` from the command-line. It will remove itself and revert your previous [Neovim](https://neovim.io/) configuration.

## Self-Promotion

Like Oh My Neovim? Follow the repository on [https://github.com/oh-my-neovim/oh-my-neovim](https://github.com/oh-my-neovim/oh-my-neovim) and vote for it.

## Credits

I would like to thank [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) project, from which I borrowed install/upgrade/uninstall processes and another good ideas.

## License

Oh My Neovim is released under the [MIT license](LICENSE).
