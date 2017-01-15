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

printf "${BLUE}Updating plugins...${NORMAL}\n"
env OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" nvim -c ":PlugUpdate" -c ":qa!" --headless || {
  printf "Error: Update plugins failed\n"
  printf "Please start nvim and run ':PlugUpdate' manually\n"
}

env OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" nvim -c ":UpdateRemotePlugins" -c ":qa!" --headless || {
  printf "Error: Update remote plugins failed\n"
  printf "Please start nvim and run ':UpdateRemotePlugins' manually\n"
}

printf "\n${GREEN}Neovim plugins are now installed!${NORMAL}\n"
