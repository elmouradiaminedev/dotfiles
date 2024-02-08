#!/usr/bin/env bash

# Install xcode command line tools
xcode-select --install

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

else
    # Updating Homebrew
    echo "Updating Homebrew..."
    brew update
fi

# Install dependencies
echo "Installing Homebrew packages..."
brew bundle --file ./brew/Brewfile

# Clean Homebrew 
echo "Cleaning Homebrew..."
brew cleanup
