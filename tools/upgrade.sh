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

printf "${BLUE}%s${NORMAL}\n" "Updating Oh My Neovim"
cd "$OH_MY_NEOVIM"
if git pull --rebase --stat origin master
then
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh "$OH_MY_NEOVIM/tools/install_plugin_dependencies.sh"
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh "$OH_MY_NEOVIM/tools/install_plugins.sh"
  printf "${BLUE}%s${NORMAL}\n" "Hooray! Oh My Neovim has been updated and/or is at the current version. Please restart your neovim!"
else
  printf "${RED}%s${NORMAL}\n" 'There was an error updating. Try again later?'
fi
