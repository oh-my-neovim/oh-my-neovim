#!/bin/sh
OS_TYPE=$(uname)
if [ "$OS_TYPE" = Darwin ]; then
  # uninstall dependencies
  brew uninstall editorconfig
elif [ "$OS_TYPE" = Linux ]; then
  # uninstall dependencies
  if [ -f /etc/debian_version ]; then
      sudo apt-get uninstall -y -q editorconfig
    elif [ -f /etc/redhat-release ]; then
      sudo yum -y uninstall editorconfig
  fi
fi
