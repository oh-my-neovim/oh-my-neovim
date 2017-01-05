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

printf "${GREEN}Downloading .editorconfig gist file from github...${NORMAL}\n"
curl -O -L https://gist.githubusercontent.com/yacut/06336cb696d6a3d90a8c616568d042d2/raw

printf "${GREEN}Downloading .eslintrc gist file from github...${NORMAL}\n"
curl -O -L https://gist.githubusercontent.com/yacut/dd7dc37afd9d28b53205ca4e8b55312e/raw

printf "${GREEN}Downloading .tern-project gist file from github...${NORMAL}\n"
curl -O -L https://gist.githubusercontent.com/yacut/eb88f02b9fa31db77baae2cede568517/raw

printf "${GREEN}Config files for nodejs project created!${NORMAL}\n"