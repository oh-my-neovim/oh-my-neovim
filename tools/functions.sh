install_extension_dependencies_oh_my_neovim () {
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" sh $OH_MY_NEOVIM/tools/install_extension_dependencies.sh
}

install_extensions_oh_my_neovim () {
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" sh $OH_MY_NEOVIM/tools/install_extensions.sh
}

upgrade_oh_my_neovim () {
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" sh $OH_MY_NEOVIM/tools/upgrade.sh
}

uninstall_oh_my_neovim () {
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" sh $OH_MY_NEOVIM/tools/uninstall.sh
}

select_extensions_oh_my_neovim () {
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" sh $OH_MY_NEOVIM/tools/select_extensions.sh
}

create_dotfiles_nodejs () {
  printf "Createing .editorconfig...\n"
  cp $OH_MY_NEOVIM/.editorconfig .

  printf "Creating .eslintrc...${NORMAL}\n"
  cp $OH_MY_NEOVIM/extensions/nodejs/.eslintrc.json .

  printf "Creating .tern-project...${NORMAL}\n"
  cp $OH_MY_NEOVIM/extensions/javascript/.tern-project .

  printf "Creating .jsbeautifyrc...${NORMAL}\n"
  cp $OH_MY_NEOVIM/extensions/javascript/.jsbeautifyrc .

  printf "Dotfiles for nodejs project are created!\n"
}

create_dotfiles_reactjs () {
  printf "Createing .editorconfig...\n"
  cp $OH_MY_NEOVIM/.editorconfig .

  printf "Creating .eslintrc...${NORMAL}\n"
  cp $OH_MY_NEOVIM/extensions/react/.eslintrc.json .

  printf "Creating .tern-project...${NORMAL}\n"
  cp $OH_MY_NEOVIM/extensions/javascript/.tern-project .

  printf "Creating .jsbeautifyrc...${NORMAL}\n"
  cp $OH_MY_NEOVIM/extensions/javascript/.jsbeautifyrc .

  printf "Dotfiles for nodejs project are created!\n"
}
