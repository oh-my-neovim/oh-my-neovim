#!/bin/sh
OS_TYPE=$(uname)
if [ "$OS_TYPE" = Darwin ]; then
  # install dependencies
  brew install the_silver_searcher
elif [ "$OS_TYPE" = Linux ]; then
  # install dependencies
  if [ -f /etc/debian_version ]; then
      sudo apt-get install -y -q silversearcher-ag
    elif [ -f /etc/redhat-release ]; then
      sudo yum -y install the_silver_searcher
  fi
fi
