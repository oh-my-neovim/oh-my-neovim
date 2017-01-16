#!/bin/sh
. $OH_MY_NEOVIM/tools/custom.sh

read -r -p "${RED}Would you like uninstall dependencies for selected plugins? [y/N]${NORMAL} " confirmation
if [ "$confirmation" = y ] || [ "$confirmation" = Y ]; then
  if [ "$(uname)" = Darwin ]; then
    plugins=$(echo $OH_MY_NEOVIM_PLUGINS | tr ' ' "\n")
  else
    plugins=$(echo "$OH_MY_NEOVIM_PLUGINS" | grep -o -e "[^ ]*")
  fi
  for plugin in $plugins; do
    printf "${BLUE}Uninstalling dependencies for $plugin ...${NORMAL}\n"
    if [ -f $OH_MY_NEOVIM/templates/$plugin/install.sh ]; then
      env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh "$OH_MY_NEOVIM/templates/$plugin/uninstall.sh" || {
        printf "Error: Uninstall dependencies for plugin \"$plugin\" failed\n"
      }
    fi
  done
  plugins=
else
  exit 0
fi

printf "\n${GREEN}Oh my Neovim plugin dependencies are now installed!${NORMAL}\n"
