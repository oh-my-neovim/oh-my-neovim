#!/bin/sh
# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  NORMAL="$(tput sgr0)"
else
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  BOLD=""
  NORMAL=""
fi

# Only enable exit-on-error after the non-critical colorization stuff,
# which may fail on systems lacking tput or terminfo
set -e

printf "${BLUE}Looking for an existing vim config...${NORMAL}\n"
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
  printf "${YELLOW}Found ~/.vimrc.${NORMAL} ${GREEN}Backing up to ~/.vimrc.pre-upgrade${NORMAL}\n";
  mv -f ~/.vimrc ~/.vimrc.pre-upgrade;
fi

printf "${BLUE}Looking for plug.vim file...${NORMAL}\n"
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  printf "${YELLOW}plug.vim not found...${NORMAL} ${GREEN}Downloading it from github...${NORMAL}\n";
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
fi

printf "${BLUE}Downloading .vimrc gist file from github...${NORMAL}\n"
curl -o ~/.vimrc -L https://raw.githubusercontent.com/yacut/workspace/master/.vimrc
printf "${GREEN}Vim config upgraded!${NORMAL}\n"

printf "${BLUE}Checking neovim links${NORMAL}\n"
if [ ! -d ~/.config/nvim ] || [ ! -h ~/.config/nvim ]; then
  printf "${GREEN}Creating ~/.config/nvim link.${NORMAL}\n";
  ln -s ~/.vim ~/.config/nvim
fi
if [ ! -f ~/.config/nvim/init.vim ] || [ ! -h ~/.config/nvim/init.vim ]; then
  printf "${GREEN}Creating ~/.config/nvim/init.vim link.${NORMAL}\n";
  ln -s ~/.vimrc ~/.config/nvim/init.vim
fi

OS_TYPE=$(uname)
if [ "$OS_TYPE" = Darwin ]; then
  if [ ! -f ~/Library/Fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf ]; then
    printf "${BLUE}Downloading Sauce Code Pro Nerd Fonts to ~/Library/Fonts folder...${NORMAL}\n"
    cd ~/Library/Fonts && \
      curl -fLo "SourceCodePro.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v1.0.0/SourceCodePro.zip && \
      unzip -o SourceCodePro.zip && rm SourceCodePro.zip;
  fi
  
  printf "${BLUE}Installing dependencies...${NORMAL}\n";
  brew install node editorconfig the_silver_searcher libxml2 python python3;
  pip install yamllint ansible-lint;
  
  printf "${BLUE}Updating global npm packages...${NORMAL}\n";
  npm install -g tern@latest eslint@latest jsonlint@latest babel-eslint@latest eslint-plugin-react@latest;
fi

if [ "$OS_TYPE" = Linux ]; then
  if [ ! -f ~/.local/share/fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf ]; then
    printf "${BLUE}Downloading Sauce Code Pro Nerd Fonts to ~/.local/share/fonts folder...${NORMAL}\n";
    mkdir -p ~/.local/share/fonts;
    cd ~/.local/share/fonts && \
      curl -fLo "SourceCodePro.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v1.0.0/SourceCodePro.zip && \
      unzip -o SourceCodePro.zip && rm SourceCodePro.zip;
  fi
  
  printf "${BLUE}Installing dependencies...${NORMAL}\n";
  if [ -f /etc/debian_version ]; then
      sudo apt-get install -y -q node editorconfig silversearcher-ag libxml2-utils python-pip;
  elif [ -f /etc/redhat-release ]; then
      printf "${BLUE}Installing nodejs...${NORMAL}\n";
      sudo yum -y install nodejs the_silver_searcher python-pip;
  fi
  sudo pip install yamllint ansible-lint;
  
  printf "${BLUE}Updating global npm packages...${NORMAL}\n";
  sudo npm install -g tern@latest eslint@latest jsonlint@latest babel-eslint@latest eslint-plugin-react@latest;
fi

printf "${BLUE}Updating plugins...${NORMAL}\n"
hash nvim >/dev/null 2>&1 || {
  echo "\nError: neovim is not installed"
  exit 1
}
nvim -c ":PlugUpdate" -c ":qa!" --headless
printf "\n\n${GREEN}Plugins updated!${NORMAL}\n"
