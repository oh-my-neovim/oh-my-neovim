#!/bin/sh
. $OH_MY_NEOVIM/tools/custom.sh
read -r -p "Are you sure you want to remove Oh My NeoVim? [y/N] " confirmation
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

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" sh "$OH_MY_NEOVIM/tools/uninstall_extension_dependencies.sh"


edit_pattern_in_shell_profile "export OH_MY_NEOVIM=.*" "export OH_MY_NEOVIM=$OH_MY_NEOVIM"
edit_pattern_in_shell_profile "export OH_MY_NEOVIM_EXTENSIONS=.*" "export OH_MY_NEOVIM_EXTENSIONS=\"$OH_MY_NEOVIM_EXTENSIONS\""
edit_pattern_in_shell_profile "source $OH_MY_NEOVIM/tools/functions.sh" "source $OH_MY_NEOVIM/tools/functions.sh"

if [ -d $OH_MY_NEOVIM ]; then
  rm -rf $OH_MY_NEOVIM
fi
echo "\nThanks for trying out Oh My Neovim. It's been uninstalled."
