#!/bin/bash
set -xe

# Clone submodules in tree
git submodule update --init

if [ -z $AUGEAS ]; then
  # Use latest version of lenses
  cd augeas && git pull origin master
else
  if [ -z $LENSES ]; then
    # Use matching version of lenses
    cd augeas && git fetch && git checkout release-${AUGEAS}
  else
    cd augeas && git fetch && git checkout $LENSES
  fi
fi

# Install gems
gem install bundler
bundle install

# Reporting only
bundle show
puppet --version
augtool --version
