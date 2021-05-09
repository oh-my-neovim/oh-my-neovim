#!/bin/sh
OS_TYPE=$(uname)
if [ "$OS_TYPE" = Darwin ]; then
  # install font
  rm ~/Library/Fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf || true
  if [ ! -f ~/Library/Fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf ]; then
    cd ~/Library/Fonts && \
      curl -sfLo "SourceCodePro.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip && \
      unzip -o SourceCodePro.zip && rm SourceCodePro.zip
  fi
elif [ "$OS_TYPE" = Linux ]; then
  # install font
  rm ~/.local/share/fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf || true
  if [ ! -f ~/.local/share/fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf ]; then
    printf "${BLUE}Downloading Sauce Code Pro Nerd Fonts to ~/.local/share/fonts folder...${NORMAL}\n"
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts && \
      curl -sfLo "SourceCodePro.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip && \
      unzip -o SourceCodePro.zip && rm SourceCodePro.zip
  fi
fi
# add ruby to PATH
. $OH_MY_NEOVIM/tools/custom.sh
add_to_shell_profile_if_pattern_not_found "PATH=\"$(ruby -e 'print Gem.user_dir')/bin:\$PATH\"" "PATH=\"$(ruby -e 'print Gem.user_dir')/bin:\$PATH\""
