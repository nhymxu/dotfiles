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

brew install fzf
brew install terminal-notifier

brew install diff-so-fancy

#---------------
# Browser

brew install --cask firefox

brew install --cask pritunl # openvpn client
brew install --cask postman

brew install --cask zoom

#---------------
# Development

brew install --cask visual-studio-code
brew install --cask sublime-text
brew install --cask pycharm
# brew install --cask phpstorm
brew install --cask goland
brew install --cask datagrip
brew install --cask intellij-idea

brew install kubectl kubectx

brew install asdf
asdf plugin-add python
asdf global python system # using default python version is macOS pre-installed

asdf plugin-add php
brew install pkg-config bison bzip2 freetype gettext libiconv icu4c jpeg libedit libpng libxml2 libzip openssl@1.1 readline webp zlib re2c gd krb5 oniguruma   # require to build php

#---------------
# Productivity tools

brew install --cask 1password 1password-cli
brew install --cask maccy # clipboard history
brew install --cask iterm2

#---------------
# Office

brew install --cask calibre

#---------------
# Multimedia

brew install ffmpeg

#---------------
# Other system tools

brew install --cask itsycal
brew install --cask veracrypt
brew install aria2
brew install screen

#---------------
# Ultilities

brew install --cask hiddenbar

#------------ Remove outdated versions from the cellar.
brew cleanup
