function clear_dns() {
	echo "Killing mDNSResponder....";
	sudo killall -HUP mDNSResponder;
	echo "Killing mDNSResponderHelper....";
	sudo killall mDNSResponderHelper;
	echo "Flushing cache....";
	sudo dscacheutil -flushcache
}

alias pyenvi='CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias shell-reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias print-path='echo -e ${PATH//:/\\n}'

# Upgrade / Update outdated casks installed. 
#alias brew_upgrade_cask="brew upgrade $(brew outdated --cask --greedy --quiet)"
alias brew_upgrade_cask="brew outdated --cask --greedy --quiet | xargs -n1 brew upgrade"
