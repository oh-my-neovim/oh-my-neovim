#!/bin/sh
OS_TYPE=$(uname)
if [ "$OS_TYPE" = Darwin ]; then
  # install dependencies
  brew install node yarn
elif [ "$OS_TYPE" = Linux ]; then
  # install dependencies
  if [ -f /etc/debian_version ]; then
      if [ ! -f /etc/apt/sources.list.d/nodesource.list ]; then
        curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash
      fi
      if [ ! -f /etc/apt/sources.list.d/yarn.list ]; then
        curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
      fi
      sudo apt-get install -y -q nodejs yarn
    elif [ -f /etc/redhat-release ]; then
      curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
      sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
      sudo yum -y install nodejs yarn
  fi
fi
