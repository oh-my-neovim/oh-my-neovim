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

# Only enable exit-on-error after the non-critical colorization stuff,
# which may fail on systems lacking tput or terminfo
set -e

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
else
  exit 0
fi

printf "\n${GREEN}Oh my Neovim plugin dependencies are now installed!${NORMAL}\n"
