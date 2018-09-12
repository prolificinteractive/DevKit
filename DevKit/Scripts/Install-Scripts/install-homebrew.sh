#/bin/bash

installed_homebrew=`brew --version || true`

if [[ $installed_homebrew == *"command not found"* ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew already installed, skipping installation"
fi
