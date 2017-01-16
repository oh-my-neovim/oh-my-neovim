#!/bin/sh
. $OH_MY_NEOVIM/tools/custom.sh

printf "${BLUE}%s${NORMAL}\n" "Updating Oh My Neovim"
cd "$OH_MY_NEOVIM"
if git pull --rebase --stat origin master
then
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh "$OH_MY_NEOVIM/tools/install_plugin_dependencies.sh"
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh "$OH_MY_NEOVIM/tools/install_plugins.sh"
  print_logo
  printf "${BLUE}%s${NORMAL}\n" "Hooray! Oh My Neovim has been updated and/or is at the current version. Please restart your neovim!"
else
  printf "${RED}%s${NORMAL}\n" 'There was an error updating. Try again later?'
fi
