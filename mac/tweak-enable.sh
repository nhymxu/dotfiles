#!/bin/bash

###############################################################################
# Custom values                                                               #
###############################################################################

HOSTNAME="Dz-MacBook-Pro"
WALLPAPER="Mondscheinlandschaft_mit_Ruine.jpg"

###############################################################################
# Setup                                                                       #
###############################################################################

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

source ~/dotfiles/mac/tweaks/general-ui-ux.sh

###############################################################################
# Energy saving                                                               #
###############################################################################

source ~/dotfiles/mac/tweaks/energy-saving.sh

###############################################################################
# Screen                                                                      #
###############################################################################

source ~/dotfiles/mac/tweaks/screen.sh

###############################################################################
# Finder                                                                      #
###############################################################################

source ~/dotfiles/mac/tweaks/finder.sh

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

source ~/dotfiles/mac/tweaks/dock-hotcorners.sh

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

source ~/dotfiles/mac/tweaks/safari.sh

###############################################################################
# Spotlight                                                                   #
###############################################################################

source ~/dotfiles/mac/tweaks/spotlight.sh

###############################################################################
# Mac App Store                                                               #
###############################################################################

source ~/dotfiles/mac/tweaks/mac-app-store.sh

###############################################################################
# Other apps                                                                    #
###############################################################################

source ~/dotfiles/mac/tweaks/other-app.sh

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Mail" \
	"Messages" \
	"Opera" \
	"Photos" \
	"Safari" \
	"SystemUIServer" \
	"Terminal" \
	"iCal"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
