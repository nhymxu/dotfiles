# Other note for Mac setup

## Install homebrew application to other folder

Default folder to install application is `/Applications`.
Can change to `~/Application` or something like `/Applications/Homebrew` ([Document](https://github.com/Homebrew/homebrew-cask/blob/master/USAGE.md#options))

Just add this line to `~/.zshrc` or `~/.bashrc` and restart your shell

```shell
# Specify your defaults in this environment variable
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
```

## macOS quick actions

Store on `mac/workflows`

Automator Quick Actions are saved into /Users/username/Library/Services. By default, Workflows are saved in the Workflows folder in the local library, or anywhere you specifically request they be saved. However, Calendar, Folder, and Image Capture workflows are stored in the respective folders in Workflows/Applications. Printer plug-ins get saved in the local Library's PDF Services folder.
