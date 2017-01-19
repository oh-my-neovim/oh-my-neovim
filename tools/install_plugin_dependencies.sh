#!/bin/sh
. $OH_MY_NEOVIM/tools/custom.sh

read -r -p "${GREEN}Would you like to install dependencies for selected plugins? [y/N]${NORMAL} " confirmation
if [ "$confirmation" = y ] || [ "$confirmation" = Y ]; then
  if [ "$(uname)" = Darwin ]; then
    plugins=$(echo $OH_MY_NEOVIM_PLUGINS | tr ' ' "\n")
  else
    plugins=$(echo "$OH_MY_NEOVIM_PLUGINS" | grep -o -e "[^ ]*")
  fi
  for plugin in $plugins; do
    if [ -f $OH_MY_NEOVIM/templates/$plugin/install.sh ]; then
      printf "${BLUE}Installing dependencies for $plugin ...${NORMAL}\n"
      env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh "$OH_MY_NEOVIM/templates/$plugin/install.sh" || {
        printf "Error: Install dependencies for plugin \"$plugin\" failed\n"
      }
    fi
  done
else
  exit 0
fi

printf "\n${GREEN}Oh my Neovim plugin dependencies are now installed!${NORMAL}\n"
