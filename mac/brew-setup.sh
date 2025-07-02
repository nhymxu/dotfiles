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
brew install tree

brew install mas # command-line interface for the Mac App Store

brew install gnupg
brew install pinentry-mac
echo "pinentry-program $HOMEBREW_PREFIX/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf
gpgconf --kill gpg-agent

#---------------
# Shell

brew install starship

brew install fzf
brew install ripgrep
brew install terminal-notifier
brew install the_silver_searcher

brew install diff-so-fancy

brew install tmux

#---------------
# Browser

brew install --cask firefox

brew install --cask pritunl # openvpn client
brew install --cask postman

brew install --cask zoom

#---------------
# Development

brew install orbstack

brew install --cask visual-studio-code
brew install --cask sublime-text
brew install --cask pycharm
# brew install --cask phpstorm
brew install --cask goland
brew install --cask datagrip
brew install --cask intellij-idea
brew install neovim

brew install --cask lens
brew install k9s
# support connect to EKS
brew install awscli
brew install kubectl kubectx

brew install xo/xo/usql
brew install lazygit
brew install lazydocker

brew install mise

brew install libpq pkg-config bison bzip2 freetype gettext libiconv icu4c jpeg libedit libpng libzip openssl@1.1 readline webp zlib re2c gd krb5 oniguruma   # require to build php

brew install libxml2 # uninstall before php 8.0.30

brew install mysql-client

#---------------
# Productivity tools

brew install --cask 1password 1password-cli
# clipboard history
brew install --cask maccy
brew install --cask iterm2

#---------------
# Office

brew install --cask gotiengviet
brew install --cask calibre
brew install obsidian

brew install --cask lark

#---------------
# Multimedia

brew install ffmpeg
brew install youtube-dl

#---------------
# Other system tools

brew install --cask itsycal
brew install --cask veracrypt
brew install aria2
brew install screen
brew install m-cli

#---------------
# Ultilities

brew install eget  # easy pre-built binary installation
brew install --cask hiddenbar

#---------------
# Fonts

brew install font-victor-mono font-victor-mono-nerd-font
brew install font-caskaydia-mono-nerd-font

#------------ Remove outdated versions from the cellar.
brew cleanup
