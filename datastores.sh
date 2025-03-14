#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Install data stores
brew install mysql
brew install postgresql
brew install mongo
brew install redis
brew install elasticsearch

# Install mysql workbench
# Install Cask
brew install caskroom/cask/brew-cask
brew cask install --appdir="/Applications" mysqlworkbench

# Remove outdated versions from the cellar.
brew cleanup
# Make sure we’re using the latest Homebrew.
brew update

# Install node
brew install node

# Remove outdated versions from the cellar.
brew cleanup

npm install -g gulp
npm install -g bower
npm install -g coffee-script
npm install -g grunt-cli
npm install -g jshint
npm install -g less

gem install jekyll

