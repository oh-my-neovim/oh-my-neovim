#!/bin/sh

if [ ! -f ~/.config/nvim/coc-settings.json ]; then
  cp ~/.oh-my-neovim/extensions/coc/coc-settings.json ~/.config/nvim/coc-settings.json
fi
