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
cp -f $OH_MY_NEOVIM/init.vim ~/.config/nvim/init.vim

printf "${BLUE}Checking plugin manager...${NORMAL}\n"
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  printf "${YELLOW}plug.vim not found...${NORMAL} ${GREEN}Downloading it from github...${NORMAL}\n"
  curl -sfLo ~/.nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -n "$OH_MY_NEOVIM_PLUGINS" ]; then
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
fi

CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$CURRENT_SHELL" = "zsh" ]; then
  grep -q "export OH_MY_NEOVIM=.*" ~/.zshrc || echo "export OH_MY_NEOVIM=$OH_MY_NEOVIM" >> ~/.zshrc
  grep -q "export OH_MY_NEOVIM_PLUGINS=.*" ~/.zshrc || echo "export OH_MY_NEOVIM_PLUGINS=\"$OH_MY_NEOVIM_PLUGINS\"" >> ~/.zshrc
else
  grep -q "export OH_MY_NEOVIM=.*" ~/.profile || echo "export OH_MY_NEOVIM=$OH_MY_NEOVIM" >> ~/.profile
  grep -q "export OH_MY_NEOVIM_PLUGINS=.*" ~/.profile || echo "export OH_MY_NEOVIM_PLUGINS=\"$OH_MY_NEOVIM_PLUGINS\"" >> ~/.profile
fi

read -r -p "${GREEN}Would you like install dependencies for selected plugins? [y/N]${NORMAL} " confirmation
if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then
  OH_MY_NEOVIM_PLUGINS_ARRAY=$(echo "$OH_MY_NEOVIM_PLUGINS" | tr -d " ")
  for plugin in "${OH_MY_NEOVIM_PLUGINS_ARRAY[@]}"; do
    echo "$plugin"
    if [ -f $OH_MY_NEOVIM/templates/$plugin/install.sh ]; then
      env sh "$OH_MY_NEOVIM/templates/$plugin/install.sh" || {
        printf "Error: Install dependencies for plugin \"$plugin\" failed\n"
      }
    fi
  done
fi

printf "${BLUE}Updating plugins...${NORMAL}\n"
env OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" nvim -c ":PlugInstall" -c ":qa!" --headless || {
  printf "Error: Update plugins failed\n"
  printf "Please start nvim and run ':PlugInstall' manually\n"
  exit 1
}

env OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" nvim -c ":UpdateRemotePlugins" -c ":qa!" --headless || {
  printf "Error: Update remote plugins failed\n"
  printf "Please start nvim and run ':UpdateRemotePlugins' manually\n"
  exit 1
}

printf "\n${GREEN}Oh my Neovim is now installed!${NORMAL}\n"
printf "${GREEN}Please change the oh_my_neovim environments in your shell profile to select plugins, themes, and options.${NORMAL}\n"
env $CURRENT_SHELL
