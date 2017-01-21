#!/bin/sh
. $OH_MY_NEOVIM/tools/custom.sh

read -r -p "${RED}Would you like to uninstall dependencies for selected plugins? [y/N]${NORMAL} " confirmation
if [ "$confirmation" = y ] || [ "$confirmation" = Y ]; then
  # for macos
  if [ "$(uname)" = Darwin ]; then
    plugins=$(echo $OH_MY_NEOVIM_PLUGINS | tr ' ' "\n")
    hash brew >/dev/null 2>&1 || {
      echo "Error: brew is not installed"
      echo "Please visit http://brew.sh/ and install homebrew"
      exit 0
    }
    for plugin in $plugins; do
      if [ -f $OH_MY_NEOVIM/templates/$plugin/brew ]; then
        brew_packages=$(cat $OH_MY_NEOVIM/templates/$plugin/brew)
        printf "${BLUE}Remove $brew_packages with brew for $plugin plugin...${NORMAL}\n"
        brew uninstall $brew_packages || {
          printf "Error [brew]: Removing dependencies for plugin \"$plugin\" failed\n"
        }
      fi
    done
  fi
  # for linux
  if [ "$OS_TYPE" = Linux ]; then
    plugins=$(echo "$OH_MY_NEOVIM_PLUGINS" | grep -o -e "[^ ]*")
    for plugin in $plugins; do
      # debian based system
      if [ -f /etc/debian_version ]; then
        if [ -f $OH_MY_NEOVIM/templates/$plugin/apt ]; then
          apt_packages=$(cat $OH_MY_NEOVIM/templates/$plugin/apt)
          printf "${BLUE}Remove $apt_packages with apt for $plugin plugin...${NORMAL}\n"
          printf "${RED}sudo permissions required${NORMAL}\n"
          sudo apt-get uninstall -y $apt_packages || {
            printf "Error [apt]: Removing dependencies for plugin \"$plugin\" failed\n"
          }
        fi
      elif [ -f /etc/redhat-release ]; then
        if [ -f $OH_MY_NEOVIM/templates/$plugin/yum ]; then
          yum_packages=$(cat $OH_MY_NEOVIM/templates/$plugin/yum)
          printf "${BLUE}Remove $yum_packages with apt for $plugin plugin...${NORMAL}\n"
          printf "${RED}sudo permissions required${NORMAL}\n"
          sudo yum -y uninstall $yum_packages || {
            printf "Error [yum]: Removing dependencies for plugin \"$plugin\" failed\n"
          }
        fi
      fi
    done
  fi

  # for all systems
  for plugin in $plugins; do
    # custom shell scripts
    if [ -f $OH_MY_NEOVIM/templates/$plugin/uninstall.sh ]; then
      printf "${BLUE}Remove dependencies for $plugin plugin...${NORMAL}\n"
      env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS" sh "$OH_MY_NEOVIM/templates/$plugin/uninstall.sh" || {
        printf "Error [sh]: Removing dependencies for plugin \"$plugin\" failed\n"
      }
    fi
    # pip2
    if [ -f $OH_MY_NEOVIM/templates/$plugin/pip2 ]; then
      pip2_packages=$(cat $OH_MY_NEOVIM/templates/$plugin/pip2)
      printf "${BLUE}Uninstall $pip2_packages with pip2 for $plugin plugin...${NORMAL}\n"
      pip2 uninstall --user $pip2_packages || {
        printf "Error [pip2]: Removing dependencies for plugin \"$plugin\" failed\n"
      }
    fi
    # pip3
    if [ -f $OH_MY_NEOVIM/templates/$plugin/pip3 ]; then
      pip3_packages=$(cat $OH_MY_NEOVIM/templates/$plugin/pip3)
      printf "${BLUE}Uninstall $pip3_packages with pip3 for $plugin plugin...${NORMAL}\n"
      pip3 uninstall --user $pip3_packages || {
        printf "Error [pip3]: Removing dependencies for plugin \"$plugin\" failed\n"
      }
    fi
    # gem
    if [ -f $OH_MY_NEOVIM/templates/$plugin/gem ]; then
      gem_packages=$(cat $OH_MY_NEOVIM/templates/$plugin/gem)
      printf "${BLUE}Uninstall $gem_packages with gem for $plugin plugin...${NORMAL}\n"
      gem uninstall --user-install $gem_packages || {
        printf "Error [gem]: Removing dependencies for plugin \"$plugin\" failed\n"
      }
    fi
    # npm
    if [ -f $OH_MY_NEOVIM/templates/$plugin/npm ]; then
      npm_packages=$(cat $OH_MY_NEOVIM/templates/$plugin/npm)
      if hash yarn 2>/dev/null; then
        node_package_manager_command="yarn global remove --global-folder $NPM_GLOBAL_FOLDER"
      elif hash npm 2>/dev/null; then
        node_package_manager_command="npm uninstall --global"
      else
        echo "Error: npm or yarn is not installed"
        echo "Please visit https://yarnpkg.com/ or https://nodejs.org/ and install node package manager"
        exit 0
      fi
      printf "${BLUE}Remove $npm_packages with node package manager for $plugin plugin...${NORMAL}\n"
      sh -c "$node_package_manager_command $npm_packages" || {
        printf "Error [npm]: Removing for plugin \"$plugin\" failed\n"
      }
    fi
  done
  printf "\n${GREEN}Oh my Neovim plugin dependencies are now removed!${NORMAL}\n"
else
  exit 0
fi

