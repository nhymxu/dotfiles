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

function emptytrash2() {
  sudo rm -rfv /Volumes/*/.Trashes/*
  sudo rm -rfv '~/Library/Mobile Documents/*/.Trash/*'
  sudo rm -rfv ~/.Trash/*
  sudo rm -rfv /private/var/log/asl/*.asl
  sudo rm -rfv ~/Library/Mobile\ Documents/**/.Trash/*
  sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'
} 2>/dev/null

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
alias brew_upgrade_cask="brew outdated --cask --greedy --quiet | xargs -n1 brew upgrade --cask"

alias brew_upgrade_all="brew update && brew upgrade && brew upgrade --cask --greedy"
alias brew-outdated="brew outdated --fetch-HEAD"

brewpackages (){
  brew list --formula | xargs -n1 -P8 -I {} \
    sh -c "brew info {} | egrep '[0-9]* files, ' | sed 's/^.*[0-9]* files, \(.*\)).*$/{} \1/'" | \
    sort -h -r -k2 - | column -t
}

# sudo softwareupdate -i -a
alias update='mas upgrade; brew update; brew upgrade; brew upgrade --cask --greedy; brew cleanup'

renice_ggbackup() {
    if [ -z "$1" ]; then
        for f in $(pgrep 'Backup and Sync'; pgrep 'FinderSyncAPIExtension'); do renice +20 -p $f; done
        return;
    fi

    for f in $(pgrep 'Backup and Sync'; pgrep 'FinderSyncAPIExtension'); do renice +${1} -p $f; done
}

restore_ggbackup () {
    for f in $(pgrep 'Backup and Sync'; pgrep 'FinderSyncAPIExtension'); do renice 0 -p $f; done
}

alias ll='ls -lah'

# Append NOTIF to your command to have a notification once it is done, clicking
# on the notification will focus a terminal.
# require terminal-notifier: brew install terminal-notifier
alias -g NOTIF=';terminal-notifier -group endCommandNotif -activate com.apple.Terminal -ignoreDnD -sound default -message done'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"
