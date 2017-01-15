#!/bin/sh
# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  NORMAL="$(tput sgr0)"
else
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  BOLD=""
  NORMAL=""
fi

env OH_MY_NEOVIM=$OH_MY_NEOVIM sh "$OH_MY_NEOVIM/tools/uninstall_plugin_dependencies.sh"

if [ "$(uname)" = Darwin ]; then
  AVAILABLE_PLUGINS=""
  for plugin in $(find $OH_MY_NEOVIM/templates/* -maxdepth 1 -type d -exec basename {} \;); do
      if [ ! -n "$AVAILABLE_PLUGINS" ]; then
          AVAILABLE_PLUGINS="\"$plugin\""
      else
          AVAILABLE_PLUGINS="$AVAILABLE_PLUGINS, \"$plugin\""
      fi
  done
  SELECTED_PLUGINS=$(osascript -e "choose from list {$AVAILABLE_PLUGINS} with title \"Plugins selector\" with prompt \"Choose oh-my-neovim plugins to install\" OK button name \"OK\" cancel button name \"Cancel\" default items {\"default\"} with multiple selections allowed")
  OH_MY_NEOVIM_PLUGINS=$(echo "$SELECTED_PLUGINS"| tr -d ',')
else
  # Set plugins
  AVAILABLE_PLUGINS=$(find $OH_MY_NEOVIM/templates/* -maxdepth 1 -type d -exec basename {} \; -exec echo {} \; -exec echo ON \;)
  CHOOSED_PLUGINS=$(whiptail --checklist "Choose plugins to install" 28 70 20 ${AVAILABLE_PLUGINS} 3>&1 1>&2 2>&3)
  exitstatus=$?
  if [ $exitstatus = 0 ]; then
    OH_MY_NEOVIM_PLUGINS=$(echo "$CHOOSED_PLUGINS"| tr -d '"')
  else
    OH_MY_NEOVIM_PLUGINS="default"
  fi
fi

CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$CURRENT_SHELL" = "zsh" ]; then
  if [ "$OS_TYPE" = Darwin ]; then
    sed -i "" "s/export OH_MY_NEOVIM_PLUGINS=\".*/export OH_MY_NEOVIM_PLUGINS=\"$OH_MY_NEOVIM_PLUGINS\"/g" ~/.zshrc
  else
    sed -i "s/export OH_MY_NEOVIM_PLUGINS=\".*/export OH_MY_NEOVIM_PLUGINS=\"$OH_MY_NEOVIM_PLUGINS\"/g" ~/.zshrc
  fi
else
  if [ "$OS_TYPE" = Darwin ]; then
    sed -i "" "s/export OH_MY_NEOVIM_PLUGINS=\".*/export OH_MY_NEOVIM_PLUGINS=\"$OH_MY_NEOVIM_PLUGINS\"/g" ~/.profile
  else
    sed -i "s/export OH_MY_NEOVIM_PLUGINS=\".*/export OH_MY_NEOVIM_PLUGINS=\"$OH_MY_NEOVIM_PLUGINS\"/g" ~/.profile
  fi
fi

env OH_MY_NEOVIM_PLUGINS=$OH_MY_NEOVIM_PLUGINS sh $OH_MY_NEOVIM/tools/install_plugin_dependencies.sh || {
  printf "Error: Plugin dependencies installation failed\n"
}

env OH_MY_NEOVIM_PLUGINS=$OH_MY_NEOVIM_PLUGINS sh $OH_MY_NEOVIM/tools/install_plugins.sh || {
  printf "Error: Plugins installation failed\n"
}

printf "\n${GREEN}New Oh my Neovim plugins is now installed!${NORMAL}\n"
