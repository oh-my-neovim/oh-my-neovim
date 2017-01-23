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

add_to_shell_profile_if_pattern_not_found () {
  CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
  if [ "$CURRENT_SHELL" = "zsh" ]; then
    grep -q "$1" ~/.zshrc || echo "\n$2" >> ~/.zshrc
  elif [ "$CURRENT_SHELL" = "bash" ]; then
    if [ "$(uname)" = Darwin ]; then
      grep -q "$1" ~/.bash_profile || echo "\n$2" >> ~/.bash_profile
    else
      grep -q "$1" ~/.bashrc || echo "\n$2" >> ~/.bashrc
    fi
  else
    grep -q "$1" ~/.profile || echo "\n$2" >> ~/.profile
  fi
}

edit_pattern_in_shell_profile () {
CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$(uname)" = Darwin ]; then
  if [ "$CURRENT_SHELL" = "zsh" ]; then
    sed -i "" "s/$1/$2/g" ~/.zshrc
  elif [ "$CURRENT_SHELL" = "bash" ]; then
    sed -i "" "s/$1/$2/g" ~/.bash_profile
  else
    sed -i "" "s/$1/$2/g" ~/.profile
  fi
else
  if [ "$CURRENT_SHELL" = "zsh" ]; then
    sed -i "s/$1/$2/g" ~/.zshrc
  elif [ "$CURRENT_SHELL" = "bash" ]; then
    sed -i "s/$1/$2/g" ~/.bashrc
  else
    sed -i "s/$1/$2/g" ~/.profile
  fi
fi
}

select_plugins_dialog () {
  if [ "$(uname)" = Darwin ]; then
    AVAILABLE_PLUGINS=""
    for plugin in $(find $OH_MY_NEOVIM/plugins/* -maxdepth 1 -not -path '*default*' -type d -exec basename {} \;); do
        if [ ! -n "$AVAILABLE_PLUGINS" ]; then
            AVAILABLE_PLUGINS="\"$plugin\""
        else
            AVAILABLE_PLUGINS="$AVAILABLE_PLUGINS, \"$plugin\""
        fi
    done
    SELECTED_PLUGINS=$(osascript -e "choose from list {$AVAILABLE_PLUGINS} with title \"Plugins selector\" with prompt \"Choose oh-my-neovim plugins to install\" OK button name \"OK\" cancel button name \"Cancel\" default items {\"default\"} with multiple selections allowed")
    if [ "$SELECTED_PLUGINS" = false ]; then
			OH_MY_NEOVIM_PLUGINS="default"
		else
    	OH_MY_NEOVIM_PLUGINS=$(echo "$SELECTED_PLUGINS"| tr -d ',')
    	OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS default"
		fi
  else
    if hash whiptail 2>/dev/null; then
      dialog_tool=whiptail
    elif hash dialog 2>/dev/null; then
      dialog_tool=dialog
    else
      dialog_tool=
    fi
    if [ ! -n "$dialog_tool" ]; then
      OH_MY_NEOVIM_PLUGINS="default"
    else
      AVAILABLE_PLUGINS=$(find $OH_MY_NEOVIM/plugins/* -maxdepth 1 -not -path '*default*' -type d -exec basename {} \; -exec echo {} \; -exec echo ON \;)
      CHOOSED_PLUGINS=$($dialog_tool --checklist "Choose plugins to install" 28 80 20 ${AVAILABLE_PLUGINS} 3>&1 1>&2 2>&3)
      exitstatus=$?
      if [ $exitstatus = 0 ]; then
        OH_MY_NEOVIM_PLUGINS=$(echo "$CHOOSED_PLUGINS"| tr -d '"')
        OH_MY_NEOVIM_PLUGINS="$OH_MY_NEOVIM_PLUGINS default"
      else
        OH_MY_NEOVIM_PLUGINS="default"
      fi
    fi
  fi
}

print_logo () {
  printf "${GREEN}"
  echo '   ____  __       __  ___         _   __                _         '
  echo '  / __ \/ /_     /  |/  /_  __   / | / /__  ____ _   __(_)___ ___ '
  echo ' / / / / __ \   / /|_/ / / / /  /  |/ / _ \/ __ \ | / / / __ `__ \'
  echo '/ /_/ / / / /  / /  / / /_/ /  / /|  /  __/ /_/ / |/ / / / / / / /'
  echo '\____/_/ /_/  /_/  /_/\__, /  /_/ |_/\___/\____/|___/_/_/ /_/ /_/ '
  echo '                     /____/                                       '
  echo ''
  printf "${NORMAL}"
}
