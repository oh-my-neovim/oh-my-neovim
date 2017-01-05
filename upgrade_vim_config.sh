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

printf "${BLUE}Looking for an existing vim config...${NORMAL}\n"
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
  printf "${YELLOW}Found ~/.vimrc.${NORMAL} ${GREEN}Backing up to ~/.vimrc.pre-upgrade${NORMAL}\n";
  mv -f ~/.vimrc ~/.vimrc.pre-upgrade;
fi

printf "${BLUE}Downloading .vimrc gist file from github...${NORMAL}\n"
curl -o ~/.vimrc -L https://gist.githubusercontent.com/yacut/8760f45ee9a484c1b3cbcdf2755cb220/raw
printf "${GREEN}Vim config upgraded!${NORMAL}\n"

printf "${BLUE}Updating plugins...${NORMAL}\n"
hash nvim >/dev/null 2>&1 || {
  echo "Error: neovim is not installed"
  exit 1
}
nvim -c ":PlugUpdate" -c ":qa" --headless
printf "${GREEN}Plugins updated!${NORMAL}\n"