#!/bin/sh
. $OH_MY_NEOVIM/tools/custom.sh

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh "$OH_MY_NEOVIM/tools/uninstall_plugin_dependencies.sh"

select_plugins_dialog
edit_pattern_in_shell_profile "export OH_MY_NEOVIM_PLUGINS=\".*" "export OH_MY_NEOVIM_PLUGINS=\"$OH_MY_NEOVIM_PLUGINS\""

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh $OH_MY_NEOVIM/tools/install_plugin_dependencies.sh || {
  printf "Error: Plugin dependencies installation failed\n"
}

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh $OH_MY_NEOVIM/tools/install_plugins.sh || {
  printf "Error: Plugins installation failed\n"
}

printf "\n${GREEN}New Oh my Neovim plugins is now installed!${NORMAL}\n"
env $SHELL
