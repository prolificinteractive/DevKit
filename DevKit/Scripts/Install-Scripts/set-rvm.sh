#/bin/bash

HOME=$1
RUBY_VERSION=$2
installed_ruby=$(ruby --version)

source ${HOME}/.rvm/scripts/rvm

if [[ $installed_ruby == *"$RUBY_VERSION"* ]]; then
  echo "ruby $RUBY_VERSION already installed, skipping installation"
else
  rvm install ruby-${RUBY_VERSION}
  rvm use ${RUBY_VERSION}
fi
