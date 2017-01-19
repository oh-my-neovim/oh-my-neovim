#!/bin/sh
OS_TYPE=$(uname)
if [ "$OS_TYPE" = Darwin ]; then
  # uninstall dependencies
  brew uninstall node yarn
elif [ "$OS_TYPE" = Linux ]; then
  # uninstall dependencies
  if [ -f /etc/debian_version ]; then
    sudo rm /etc/apt/sources.list.d/nodesource.list
    sudo rm /etc/apt/sources.list.d/yarn.list
    sudo apt-get uninstall -y -q nodejs yarn
  elif [ -f /etc/redhat-release ]; then
      sudo yum -y uninstall nodejs yarn
  fi
fi
