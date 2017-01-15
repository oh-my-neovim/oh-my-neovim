#!/bin/sh
OS_TYPE=$(uname)
if [ "$OS_TYPE" = Darwin ]; then
  # uninstall font
  rm ~/Library/Fonts/Sauce\ Code\ Pro*.ttf
elif [ "$OS_TYPE" = Linux ]; then
  # uninstall font
  rm ~/.local/share/fonts/Sauce\ Code\ Pro*.ttf
  # uninstall dependencies
  if [ -f /etc/debian_version ]; then
    sudo apt-get uninstall -y -q python python3 python-pip xsel ruby ruby-dev python-dev
  elif [ -f /etc/redhat-release ]; then
    sudo yum -y uninstall python-pip ruby ruby-devel python-devel
  fi
fi
# uninstall neovim providers
pip2 uninstall --quiet --user neovim
pip3 uninstall --quiet --user neovim
gem uninstall --user-install neovim
