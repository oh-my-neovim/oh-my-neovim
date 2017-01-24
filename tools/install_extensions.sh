#!/bin/sh
. $OH_MY_NEOVIM/tools/custom.sh

printf "${BLUE}Updating Neovim plugins...${NORMAL}\n"
env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" nvim -c ":PlugUpdate" -c ":qa!" --headless || {
  printf "Error: Update plugins failed\n"
  printf "Please start nvim and run ':PlugUpdate' manually\n"
}

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" nvim -c ":UpdateRemotePlugins" -c ":qa!" --headless || {
  printf "Error: Update remote plugins failed\n"
  printf "Please start nvim and run ':UpdateRemotePlugins' manually\n"
}

printf "\n${GREEN}Neovim plugins are now installed!${NORMAL}\n"
