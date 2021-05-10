#!/bin/sh
. $OH_MY_NEOVIM/tools/custom.sh

read -r -p "${RED}Would you like to uninstall dependencies for selected extensions? [y/N]${NORMAL} " confirmation
if [ "$confirmation" = y ] || [ "$confirmation" = Y ]; then
  # for macos
  if [ "$(uname)" = Darwin ]; then
    extensions=$(echo $OH_MY_NEOVIM_EXTENSIONS | tr ' ' "\n")
    hash brew >/dev/null 2>&1 || {
      echo "Error: brew is not installed"
      echo "Please visit http://brew.sh/ and install homebrew"
      exit 0
    }
    for extension in $extensions; do
      if [ -f $OH_MY_NEOVIM/extensions/$extension/brew ]; then
        brew_packages=$(cat $OH_MY_NEOVIM/extensions/$extension/brew)
        printf "${BLUE}Remove $brew_packages with brew for $extension extension...${NORMAL}\n"
        brew uninstall $brew_packages || {
          printf "Error [brew]: Removing dependencies for extension \"$extension\" failed\n"
        }
      fi
    done
  fi
  # for linux
  if [ "$(uname)" = Linux ]; then
    extensions=$(echo "$OH_MY_NEOVIM_EXTENSIONS" | grep -o -e "[^ ]*")
    for extension in $extensions; do
      # debian based system
      if [ -f /etc/debian_version ]; then
        if [ -f $OH_MY_NEOVIM/extensions/$extension/apt ]; then
          apt_packages=$(cat $OH_MY_NEOVIM/extensions/$extension/apt)
          printf "${BLUE}Remove $apt_packages with apt for $extension extension...${NORMAL}\n"
          printf "${RED}sudo permissions required${NORMAL}\n"
          sudo apt-get uninstall -y $apt_packages || {
            printf "Error [apt]: Removing dependencies for extension \"$extension\" failed\n"
          }
        fi
      elif [ -f /etc/redhat-release ]; then
        if [ -f $OH_MY_NEOVIM/extensions/$extension/yum ]; then
          yum_packages=$(cat $OH_MY_NEOVIM/extensions/$extension/yum)
          printf "${BLUE}Remove $yum_packages with apt for $extension extension...${NORMAL}\n"
          printf "${RED}sudo permissions required${NORMAL}\n"
          sudo yum -y uninstall $yum_packages || {
            printf "Error [yum]: Removing dependencies for extension \"$extension\" failed\n"
          }
        fi
      fi
    done
  fi

  # for all systems
  for extension in $extensions; do
    # custom shell scripts
    if [ -f $OH_MY_NEOVIM/extensions/$extension/uninstall.sh ]; then
      printf "${BLUE}Remove dependencies for $extension extension...${NORMAL}\n"
      env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" sh "$OH_MY_NEOVIM/extensions/$extension/uninstall.sh" || {
        printf "Error [sh]: Removing dependencies for extension \"$extension\" failed\n"
      }
    fi
    # pip2
    if [ -f $OH_MY_NEOVIM/extensions/$extension/pip2 ]; then
      pip2_packages=$(cat $OH_MY_NEOVIM/extensions/$extension/pip2)
      printf "${BLUE}Uninstall $pip2_packages with pip2 for $extension extension...${NORMAL}\n"
      pyenv activate neovim2 > /dev/null 2>&1 || true
      pip uninstall --user $pip2_packages || {
        printf "Error [pip2]: Removing dependencies for extension \"$extension\" failed\n"
      }
      pyenv deactivate > /dev/null 2>&1 || true
    fi
    # pip3
    if [ -f $OH_MY_NEOVIM/extensions/$extension/pip3 ]; then
      pip3_packages=$(cat $OH_MY_NEOVIM/extensions/$extension/pip3)
      printf "${BLUE}Uninstall $pip3_packages with pip3 for $extension extension...${NORMAL}\n"
      pyenv activate neovim3 > /dev/null 2>&1 || true
      pip uninstall --user $pip3_packages || {
        printf "Error [pip3]: Removing dependencies for extension \"$extension\" failed\n"
      }
      pyenv deactivate > /dev/null 2>&1 || true
    fi
    # gem
    if [ -f $OH_MY_NEOVIM/extensions/$extension/gem ]; then
      gem_packages=$(cat $OH_MY_NEOVIM/extensions/$extension/gem)
      printf "${BLUE}Uninstall $gem_packages with gem for $extension extension...${NORMAL}\n"
      gem uninstall --user-install $gem_packages || {
        printf "Error [gem]: Removing dependencies for extension \"$extension\" failed\n"
      }
    fi
    # npm
    if [ -f $OH_MY_NEOVIM/extensions/$extension/npm ]; then
      npm_packages=$(cat $OH_MY_NEOVIM/extensions/$extension/npm)
      if hash yarn 2>/dev/null; then
        node_package_manager_command="yarn global remove --global-folder $NPM_GLOBAL_FOLDER"
      elif hash npm 2>/dev/null; then
        node_package_manager_command="npm uninstall --global"
      else
        echo "Error: npm or yarn is not installed"
        echo "Please visit https://yarnpkg.com/ or https://nodejs.org/ and install node package manager"
        exit 0
      fi
      printf "${BLUE}Remove $npm_packages with node package manager for $extension extension...${NORMAL}\n"
      sh -c "$node_package_manager_command $npm_packages" || {
        printf "Error [npm]: Removing for extension \"$extension\" failed\n"
      }
    fi
  done
  printf "\n${GREEN}Oh my Neovim extension dependencies are now removed!${NORMAL}\n"
else
  exit 0
fi

