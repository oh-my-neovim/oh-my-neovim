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

select_plugins_oh_my_neovim () {
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh $OH_MY_NEOVIM/tools/select_plugins.sh
}

create_dotfiles_nodejs () {
  printf "Createing .editorconfig...\n"
  cp $OH_MY_NEOVIM/.editorconfig .

  printf "Creating .eslintrc...${NORMAL}\n"
  cp $OH_MY_NEOVIM/plugins/nodejs/.eslintrc.json .

  printf "Creating .tern-project...${NORMAL}\n"
  cp $OH_MY_NEOVIM/plugins/javascript/.tern-project .

  printf "Creating .jsbeautifyrc...${NORMAL}\n"
  cp $OH_MY_NEOVIM/plugins/javascript/.jsbeautifyrc .

  printf "Dotfiles for nodejs project are created!\n"
}

create_dotfiles_reactjs () {
  printf "Createing .editorconfig...\n"
  cp $OH_MY_NEOVIM/.editorconfig .

  printf "Creating .eslintrc...${NORMAL}\n"
  cp $OH_MY_NEOVIM/plugins/react/.eslintrc.json .

  printf "Creating .tern-project...${NORMAL}\n"
  cp $OH_MY_NEOVIM/plugins/javascript/.tern-project .

  printf "Creating .jsbeautifyrc...${NORMAL}\n"
  cp $OH_MY_NEOVIM/plugins/javascript/.jsbeautifyrc .

  printf "Dotfiles for nodejs project are created!\n"
}
