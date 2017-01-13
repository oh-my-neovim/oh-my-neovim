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
  printf "${YELLOW}Found ~/.vimrc. ${GREEN}Backing up to ~/.vimrc.pre-upgrade${NORMAL}\n"
  mv -f ~/.vimrc ~/.vimrc.pre-upgrade
fi

printf "${BLUE}Looking for plug.vim file...${NORMAL}\n"
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  printf "${YELLOW}plug.vim not found...${NORMAL} ${GREEN}Downloading it from github...${NORMAL}\n"
  curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

printf "${BLUE}Downloading .vimrc gist file from github...${NORMAL}\n"
curl -sfLo ~/.vimrc https://raw.githubusercontent.com/yacut/workspace/master/.vimrc
printf "${GREEN}Vim config upgraded!${NORMAL}\n"

printf "${BLUE}Checking neovim links${NORMAL}\n"
if [ ! -d ~/.config/nvim ] || [ ! -h ~/.config/nvim ]; then
  printf "${GREEN}Creating ~/.config/nvim link.${NORMAL}\n"
  ln -s ~/.vim ~/.config/nvim
fi
if [ ! -f ~/.config/nvim/init.vim ] || [ ! -h ~/.config/nvim/init.vim ]; then
  printf "${GREEN}Creating ~/.config/nvim/init.vim link.${NORMAL}\n"
  ln -s ~/.vimrc ~/.config/nvim/init.vim
fi

hash nvim >/dev/null 2>&1 || {
  echo "\n${RED}Error: neovim is not installed${NORMAL}\n"
  echo "${BLUE}https://github.com/neovim/neovim/wiki/Installing-Neovim${NORMAL}"
  exit 1
}

printf "${BLUE}Updating plugins...${NORMAL}\n"
nvim -c ":PlugUpdate" -c ":qa!" --headless
nvim -c ":UpdateRemotePlugins" -c ":qa!" --headless
print
