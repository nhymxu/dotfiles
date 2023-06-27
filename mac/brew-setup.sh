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
brew install wget

brew install gnupg
brew install pinentry-mac
echo "pinentry-program $HOMEBREW_PREFIX/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf
gpgconf --kill gpg-agent

#---------------
# Shell

brew install starship

#---------------
# Browser

brew install --cask firefox
brew install --cask microsoft-edge

brew install --cask pritunl # openvpn client
brew install --cask postman

#---------------
# Development

brew install --cask visual-studio-code
brew install --cask pycharm
brew install --cask phpstorm
brew install --cask goland
brew install --cask datagrip
brew install --cask intellij-idea

#---------------
# Productivity tools

brew install --cask 1password 1password-cli
brew install --cask maccy # clipboard history
brew install --cask iterm2

#---------------
# Office

brew install --cask calibre

#---------------
# Other system tools

brew install --cask itsycal
brew install --cask veracrypt

#------------ Remove outdated versions from the cellar.
brew cleanup
