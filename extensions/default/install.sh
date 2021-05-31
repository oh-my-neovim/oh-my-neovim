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

npm install --no-progress -g neovim > /dev/null 2>&1 || true

pyenv install 2.7.18 --skip-existing > /dev/null 2>&1 || true
pyenv install 3.9.4 --skip-existing > /dev/null 2>&1 || true

pyenv virtualenv 2.7.18 neovim2 > /dev/null 2>&1 || true
pyenv activate neovim2 > /dev/null 2>&1 || true
pip install neovim > /dev/null 2>&1 || true
pyenv deactivate > /dev/null 2>&1 || true

pyenv virtualenv 3.9.4 neovim3 > /dev/null 2>&1 || true
pyenv activate neovim3 > /dev/null 2>&1 || true
pip install neovim > /dev/null 2>&1 || true
pyenv deactivate > /dev/null 2>&1 || true

LANGUAGES=("go" "gomod" "bash" "python" "java" "javascript" "typescript" "tsx" "json" "yaml" "html" "css" "scss")
LANGUAGES_LENGTH=${#LANGUAGES[@]}
for (( j=0; j<${LANGUAGES_LENGTH}; j++ )); do
  env OH_MY_NEOVIM="$OH_MY_NEOVIM" OH_MY_NEOVIM_EXTENSIONS="$OH_MY_NEOVIM_EXTENSIONS" nvim -c ":TSInstall ${LANGUAGES[$j]}" -c ":qa!" --headless || {
    printf "Error: Install plugin dependency failed\nPlease start nvim and run ':TSInstall ${LANGUAGES[$j]}' manually\n"
  }
done

