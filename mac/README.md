# Other note for Mac setup

## Install homebrew application to other folder

Default folder to install application is `/Applications`.
Can change to `~/Application` or something like `/Applications/Homebrew` ([Document](https://github.com/Homebrew/homebrew-cask/blob/master/USAGE.md#options))

Just add this line to `~/.zshrc` or `~/.bashrc` and restart your shell

```shell
# Specify your defaults in this environment variable
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
```
