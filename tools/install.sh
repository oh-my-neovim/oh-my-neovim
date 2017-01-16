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

if [ ! -n "$OH_MY_NEOVIM" ]; then
  OH_MY_NEOVIM=~/.oh-my-neovim
fi
if [ -d "$OH_MY_NEOVIM" ]; then
  printf "${YELLOW}You already have Oh My Neovim installed.${NORMAL}\n"
  printf "You'll need to remove $OH_MY_NEOVIM if you want to re-install.\n"
  exit
fi

hash nvim >/dev/null 2>&1 || {
  echo "\n${RED}Error: neovim is not installed${NORMAL}\n"
  echo "${BLUE}https://github.com/neovim/neovim/wiki/Installing-Neovim${NORMAL}"
  exit 1
}

# Prevent the cloned repository from having insecure permissions. Failing to do
# so causes compinit() calls to fail with "command not found: compdef" errors
# for users with insecure umasks (e.g., "002", allowing group writability). Note
# that this will be ignored under Cygwin by default, as Windows ACLs take
# precedence over umasks except for filesystems mounted with option "noacl".
umask g-w,o-w
printf "${BLUE}Cloning Oh My Neovim...${NORMAL}\n"
hash git >/dev/null 2>&1 || {
  echo "Error: git is not installed"
  exit 1
}

# The Windows (MSYS) Git is not compatible with normal use on cygwin
if [ "$OSTYPE" = cygwin ]; then
  if git --version | grep msysgit > /dev/null; then
    echo "Error: Windows/MSYS Git is not supported on Cygwin"
    echo "Error: Make sure the Cygwin git package is installed and is first on the path"
    exit 1
  fi
fi
env git clone --depth=1 https://github.com/yacut/oh-my-neovim.git $OH_MY_NEOVIM || {
  printf "Error: git clone of oh-my-neovim repo failed\n"
  exit 1
}

printf "${BLUE}Looking for an existing neovim config...${NORMAL}\n"
if [ -f ~/vim/init.vim ] || [ -h ~/vim/init.vim ]; then
  printf "${YELLOW}Found ~/.config/nvim/init.vim. ${GREEN}Backing up to ~/.config/nvim/init.vim.pre-oh-my-neovim${NORMAL}\n"
  mv -f ~/.config/nvim/init.vim ~/.config/nvim/init.vim.pre-oh-my-neovim
fi
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
    printf "${YELLOW}Found ~/.vimrc. ${GREEN}Backing up to ~/.vimrc.pre-oh-my-neovim${NORMAL}\n"
    mv -f ~/.vimrc ~/.vimrc.pre-oh-my-neovim
fi

printf "${BLUE}Using the Oh My Neovim template file and adding it to ~/.config/nvim/init.vim${NORMAL}\n"
mkdir -p ~/.config/nvim
cp -f $OH_MY_NEOVIM/init.vim ~/.config/nvim/init.vim

printf "${BLUE}Checking plugin manager...${NORMAL}\n"
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  printf "${YELLOW}plug.vim not found...${NORMAL} ${GREEN}Downloading it from github...${NORMAL}\n"
  env curl -sfLo ~/.nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || {
    printf "Error: Download with curl failed\n"
  }
fi

. $OH_MY_NEOVIM/tools/custom.sh

printf "${GREEN}Selecting plugins...${NORMAL}\n"
if [ ! -n "$OH_MY_NEOVIM_PLUGINS" ]; then
  select_plugins_dialog
fi

printf "${GREEN}Configuring shell profile...${NORMAL}\n"
add_to_shell_profile_if_pattern_not_found "export OH_MY_NEOVIM=.*" "export OH_MY_NEOVIM=$OH_MY_NEOVIM"
add_to_shell_profile_if_pattern_not_found "export OH_MY_NEOVIM_PLUGINS=.*" "export OH_MY_NEOVIM_PLUGINS=\"$OH_MY_NEOVIM_PLUGINS\""
add_to_shell_profile_if_pattern_not_found "source $OH_MY_NEOVIM/tools/functions.sh" "source $OH_MY_NEOVIM/tools/functions.sh"

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh $OH_MY_NEOVIM/tools/install_plugin_dependencies.sh || {
  printf "Error: Plugin dependencies installation failed\n"
}

env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh $OH_MY_NEOVIM/tools/install_plugins.sh || {
  printf "Error: Plugins installation failed\n"
}

print_logo
printf "\n${GREEN}Oh my Neovim is now installed!${NORMAL}\n"
printf "${GREEN}Please change the oh_my_neovim environments in your shell profile to select plugins, themes, and options.${NORMAL}\n"
env $CURRENT_SHELL
