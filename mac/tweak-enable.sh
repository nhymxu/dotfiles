#!/bin/bash

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1 # normal minimum is 2 (30 ms)
defaults write NSGlobalDomain InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)

# window opening animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# speedup resizing animation
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
# restore smooth resizing transition
# defaults write NSGlobalDomain NSWindowResizeTime -float 0.2

# quick look window animation
defaults write -g QLPanelAnimationDuration -float 0
# restore
# defaults delete -g QLPanelAnimationDuration

# lauching app from the Dock
defaults write com.apple.dock launchanim -bool false
# restore
# defaults write com.apple.dock launchanim -bool true
