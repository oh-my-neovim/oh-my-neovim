#!/bin/sh
OS_TYPE=$(uname)
if [ "$OS_TYPE" = Darwin ]; then
  # install dependencies
  brew install editorconfig
elif [ "$OS_TYPE" = Linux ]; then
  # install dependencies
  if [ -f /etc/debian_version ]; then
      sudo apt-get install -y -q editorconfig
    elif [ -f /etc/redhat-release ]; then
      sudo yum -y install editorconfig
  fi
fi
