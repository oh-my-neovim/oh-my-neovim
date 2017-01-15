#!/bin/sh
OS_TYPE=$(uname)
if [ "$OS_TYPE" = Darwin ]; then
  # install font
  if [ ! -f ~/Library/Fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf ]; then
    cd ~/Library/Fonts && \
      curl -sfLo "SourceCodePro.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v1.0.0/SourceCodePro.zip && \
      unzip -o SourceCodePro.zip && rm SourceCodePro.zip
  fi
  # install dependencies
  brew install python python3 ruby
elif [ "$OS_TYPE" = Linux ]; then
  # install font
  if [ ! -f ~/.local/share/fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf ]; then
    printf "${BLUE}Downloading Sauce Code Pro Nerd Fonts to ~/.local/share/fonts folder...${NORMAL}\n"
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts && \
      curl -sfLo "SourceCodePro.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v1.0.0/SourceCodePro.zip && \
      unzip -o SourceCodePro.zip && rm SourceCodePro.zip
  fi
  # install dependencies
  if [ -f /etc/debian_version ]; then
    sudo apt-get install -y -q python python3 python-pip xsel ruby ruby-dev python-dev
  elif [ -f /etc/redhat-release ]; then
    sudo yum -y install python-pip ruby ruby-devel python-devel
  fi
fi

# add ruby to PATH
CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$CURRENT_SHELL" = "zsh" ]; then
  grep -q "PATH=\"$(ruby -e 'print Gem.user_dir')/bin:\$PATH\"" ~/.zshrc || echo "PATH=\"$(ruby -e 'print Gem.user_dir')/bin:\$PATH\"" >> ~/.zshrc
elif [ "$CURRENT_SHELL" = "bash" ]; then
  grep -q "PATH=\"$(ruby -e 'print Gem.user_dir')/bin:\$PATH\"" ~/.bashrc || echo "PATH=\"$(ruby -e 'print Gem.user_dir')/bin:\$PATH\"" >> ~/.bashrc
fi

# install neovim providers
pip2 install --quiet --user --upgrade neovim
pip3 install --quiet --user --upgrade neovim
gem install --user-install neovim
