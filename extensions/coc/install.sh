#!/bin/sh

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" nvim -c ":CocInstall coc-go" -c ":qa!" --headless || {
  printf "Error: Install coc plugins failed\nPlease start nvim and run ':CocInstall coc-go' manually\n"
}

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" nvim -c ":CocInstall coc-java" -c ":qa!" --headless || {
  printf "Error: Install coc plugins failed\nPlease start nvim and run ':CocInstall coc-java' manually\n"
}

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" nvim -c ":CocInstall coc-json" -c ":qa!" --headless || {
  printf "Error: Install coc plugins failed\nPlease start nvim and run ':CocInstall coc-json' manually\n"
}

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" nvim -c ":CocInstall coc-tsserver" -c ":qa!" --headless || {
  printf "Error: Install coc plugins failed\nPlease start nvim and run ':CocInstall coc-tsserver' manually\n"
}

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" nvim -c ":CocInstall coc-html" -c ":qa!" --headless || {
  printf "Error: Install coc plugins failed\nPlease start nvim and run ':CocInstall coc-html' manually\n"
}

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" nvim -c ":CocInstall coc-markdownlint" -c ":qa!" --headless || {
  printf "Error: Install coc plugins failed\nPlease start nvim and run ':CocInstall coc-markdownlint' manually\n"
}

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" nvim -c ":CocInstall coc-terraform" -c ":qa!" --headless || {
  printf "Error: Install coc plugins failed\nPlease start nvim and run ':CocInstall coc-terraform' manually\n"
}

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" nvim -c ":CocInstall coc-python" -c ":qa!" --headless || {
  printf "Error: Install coc plugins failed\nPlease start nvim and run ':CocInstall coc-python' manually\n"
}

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" nvim -c ":CocInstall coc-prettier" -c ":qa!" --headless || {
  printf "Error: Install coc plugins failed\nPlease start nvim and run ':CocInstall coc-prettier' manually\n"
}
