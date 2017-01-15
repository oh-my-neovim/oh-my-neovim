install_plugin_dependencies_oh_my_neovim () {
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh $OH_MY_NEOVIM/tools/install_plugin_dependencies.sh
}

install_plugins_oh_my_neovim () {
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh $OH_MY_NEOVIM/tools/install_plugins.sh
}

upgrade_oh_my_neovim () {
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh $OH_MY_NEOVIM/tools/upgrade.sh
}

uninstall_oh_my_neovim () {
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh $OH_MY_NEOVIM/tools/uninstall.sh
}
