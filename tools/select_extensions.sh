#!/bin/sh
. $OH_MY_NEOVIM/tools/custom.sh

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" sh "$OH_MY_NEOVIM/tools/uninstall_extension_dependencies.sh"

select_extensions_dialog
edit_pattern_in_shell_profile "export OH_MY_NEOVIM_EXTENSIONS=\".*" "export OH_MY_NEOVIM_EXTENSIONS=\"$OH_MY_NEOVIM_EXTENSIONS\""

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" sh $OH_MY_NEOVIM/tools/install_extension_dependencies.sh || {
  printf "Error: extension dependencies installation failed\n"
}

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" sh $OH_MY_NEOVIM/tools/install_extensions.sh || {
  printf "Error: extensions installation failed\n"
}

print_logo
printf "\n${GREEN}New Oh my Neovim extensions is now installed!${NORMAL}\n"
env $SHELL
