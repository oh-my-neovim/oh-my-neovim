#!/bin/sh
. $OH_MY_NEOVIM/tools/custom.sh

printf "${BLUE}%s${NORMAL}\n" "Updating Oh My Neovim"
cd "$OH_MY_NEOVIM"
if git pull --rebase --stat origin master
then
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" sh "$OH_MY_NEOVIM/tools/install_extension_dependencies.sh"
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" sh "$OH_MY_NEOVIM/tools/install_extensions.sh"
  print_logo
  printf "${BLUE}%s${NORMAL}\n" "Oh My Neovim has been updated. Please restart your neovim!"
else
  printf "${RED}%s${NORMAL}\n"
fi
