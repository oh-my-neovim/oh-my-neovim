#!/bin/sh
read -r -p "Are you sure you want to remove Oh My Zsh? [y/N] " confirmation
if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then
  echo "Uninstall cancelled"
  exit
fi

echo "Removing ~/.oh-my-neovim"
if [ -d ~/.oh-my-neovim ]; then
  rm -rf ~/.oh-my-neovim
fi

echo "Looking for original zsh config..."
if [ -f ~/.config/nvim/init.vim.pre-oh-my-neovim ] || [ -h ~/.config/nvim/init.vim.pre-oh-my-neovim ]; then
  echo "Found ~/.config/nvim/init.vim.pre-oh-my-neovim -- Restoring to ~/.config/nvim/init.vim";
  mv ~/.config/nvim/init.vim.pre-oh-my-neovim ~/.config/nvim/init.vim;
  echo "Your original neovim config was restored. Please restart your neovim."
fi

env OH_MY_NEOVIM=$OH_MY_NEOVIM sh "$OH_MY_NEOVIM/tools/uninstall_plugin_dependencies.sh"

echo "Thanks for trying out Oh My Neovim. It's been uninstalled."
