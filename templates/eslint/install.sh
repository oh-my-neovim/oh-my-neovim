#!/bin/sh
# install npm global packages with yarn
mkdir -p ~/.yarn-global
yarn config set prefix ~/.yarn-global
npm config set prefix ~/.yarn-global
CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$CURRENT_SHELL" = "zsh" ]; then
  grep -q "PATH=\"$HOME/.yarn-global/bin:\$PATH\"" ~/.zshrc || echo "PATH=\"$HOME/.yarn-global/bin:\$PATH\"" >> ~/.zshrc
else
  grep -q "PATH=\"$HOME/.yarn-global/bin:\$PATH\"" ~/.profile || echo "PATH=\"$HOME/.yarn-global/bin:\$PATH\"" >> ~/.profile
fi
yarn global add eslint --global-folder ~/.yarn-global
