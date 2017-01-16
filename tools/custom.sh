add_to_shell_profile_if_pattern_not_found () {
  CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
  if [ "$CURRENT_SHELL" = "zsh" ]; then
    grep -q "$1" ~/.zshrc || echo "$2" >> ~/.zshrc
  elif [ "$CURRENT_SHELL" = "bash" ]; then
    if [ "$(uname)" = Darwin ]; then
      grep -q "$1" ~/.bash_profile || echo "$2" >> ~/.bash_profile
    else
      grep -q "$1" ~/.bashrc || echo "$2" >> ~/.bashrc
    fi
  else
    grep -q "$1" ~/.profile || echo "$2" >> ~/.profile
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
    if hash whiptail 2>/dev/null; then
      dialog_tool=whiptail
    elif hash dialog 2>/dev/null; then
      dialog_tool=dialog
    else
      dialog_tool=
    fi
    if [ ! -n "dialog_tool" ]; then
      OH_MY_NEOVIM_PLUGINS="default"
    else
      AVAILABLE_PLUGINS=$(find $OH_MY_NEOVIM/templates/* -maxdepth 1 -type d -exec basename {} \; -exec echo {} \; -exec echo ON \;)
      CHOOSED_PLUGINS=$($dialog_tool --checklist "Choose plugins to install" 28 70 20 ${AVAILABLE_PLUGINS} 3>&1 1>&2 2>&3)
      exitstatus=$?
      if [ $exitstatus = 0 ]; then
        OH_MY_NEOVIM_PLUGINS=$(echo "$CHOOSED_PLUGINS"| tr -d '"')
      else
        OH_MY_NEOVIM_PLUGINS="default"
      fi
    fi
  fi
}
