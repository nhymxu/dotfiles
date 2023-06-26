#!/bin/bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

#---------------
# System ultilities

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

brew install moreutils # Install some other useful utilities like `sponge`.
brew install findutils # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install wget --with-iri
brew install gnupg

#---------------
# Shell

brew install starship

#---------------
# Browser


#---------------
# Development

brew install --cask visual-studio-code

#---------------
# Productivity tools

brew install --cask 1password 1password-cli
brew install --cask maccy # clipboard history


#------------ Remove outdated versions from the cellar.
brew cleanup
