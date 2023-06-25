#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install a modern version of zsh.
brew install zsh zsh-completions 
brew install starship

# Switch to using brew-installed bash as default shell
# if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
#   echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
#   chsh -s "${BREW_PREFIX}/bin/bash";
# fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install neovim
brew install nano
brew install micro

brew install grep
# brew install openssh
brew install screen
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install font
brew tap homebrew/cask-fonts
brew install font-fira-code
brew install font-ibm-plex
brew install font-iosevka
brew install font-juliamono
brew install font-source-code-pro-for-powerline
font-meslo-for-powerline

# Install database
brew install sqlite
brew install mysql-client

# Install other useful binaries.
brew install ack
brew install aria2
brew install bat
brew install curl

brew install git
brew install git-lfs
brew install diff-so-fancy

brew install lua
brew install p7zip
brew install pigz
brew install pv
brew install tree
brew install exa
brew install fd
brew install zopfli

brew install php composer
brew install python pyenv

brew install rclone


# --------------------
# Casks

# Install developer tools
brew install android-platform-tools
brew install datagrip
brew install phpstorm
brew install pycharm
brew install intellij-idea
brew install docker
brew install postman
brew install paw
brew install proxyman

brew install pipenv
brew install poetry

# Install office
brew install openkey
brew install bitwarden
brew install calibre
brew install evernote
brew install sublime-text
brew install visual-studio-code


brew install --cask scroll-reverser # reverses the direction of scrolling
#-------
anydesk
appcleaner
authy
binance



dozer
dropbox

filezilla
firefox
flux
gimp
gitahead
google-drive
gswitch
hiddenbar
iina
imageoptim

iterm2
itsycal
karabiner-elements
kid3
knockknock
lulu
maccy
macfuse
marta
monitorcontrol

oracle-jdk




qlcolorcode
qlmarkdown
qlstephen
raycast
rectangle
shadowsocksx-ng
skype
sourcetree

teamviewer
veracrypt

vlc
xquartz

# Remove outdated versions from the cellar.
brew cleanup
