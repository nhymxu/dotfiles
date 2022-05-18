<p align="center"> If there is a shell, there is a way</p>
<p align="center">
  <img src="https://img.shields.io/badge/Editor-neovim-brightgreen.svg" />
  <img src="https://img.shields.io/badge/Terminal-alacritty-orange.svg" />
  <img src="https://img.shields.io/badge/Shell-zsh-yellow.svg" />
  <img src="https://img.shields.io/badge/Font-SpaceMono-lightgrey.svg" />
  <br><br>
  <img src="https://i.imgur.com/pVGr7tX.png">
</p>

## How to use

### zsh plugin

```shell
source ~/.config/zsh-snap/zsh-snap/znap.zsh

znap source marlonrichert/zsh-autocomplete
znap source marlonrichert/zsh-edit

znap source marlonrichert/zsh-hist
bindkey '^[q' push-line-or-edit

export ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting

znap source wfxr/forgit
```

### Load starship prompt for zsh

```shell
export STARSHIP_CONFIG=~/dotfiles/shell/framework/starship.toml
eval "$(starship init zsh)"
```

### Load zsh custom config

```shell
[ -f ~/dotfiles/shell/zsh.sh ] && source ~/dotfiles/shell/zsh.sh
```

### Install vim

```shell
echo '
set runtimepath=~/dotfiles/editor/vim,\$VIMRUNTIME
source ~/dotfiles/editor/vim/init.vim
helptags ~/dotfiles/editor/vim/docs' > ~/.vimrc
```

### Install neovim

```shell
mkdir -p ~/.config/nvim
echo '
set runtimepath=~/dotfiles/editor/vim,\$VIMRUNTIME
source ~/dotfiles/editor/vim/init.vim
helptags ~/dotfiles/editor/vim/docs' > ~/.config/nvim/init.vim
```

### Install nano

```shell
cp ~/dotfiles/editor/nano/nanorc.sample ~/.nanorc
```

### Install micro

```shell
mkdir -p ~/.config/micro
rm -rf ~/.config/micro/settings.json
ln -s ~/dotfiles/editor/micro/settings.json ~/.config/micro/settings.json
```

### Install git

```shell
# Install diff-so-fancy
curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -o ~/bin/diff-so-fancy
chmod +x ~/bin/diff-so-fancy

# Copy example content for local config and edit this
cp ~/dotfiles/git/local.example ~/.gitconfig_local

# Install git config
rm -rf ~/.gitconfig && rm -rf ~/.gitignore_global
ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/dotfiles/git/gitignore ~/.gitignore_global
```

### Homebrew

Dump to Brewfile

```shell
brew bundle dump --force --all
```

### Curl

```shell
# Remove current config file
rm -rf ~/.curlrc && rm -rf ~/.curl-format

# Symlink config
ln -s ~/dotfiles/curl/curlrc ~/.curlrc
ln -s ~/dotfiles/curl/curl-format ~/.curl-format
```

### wget

```shell
# Remove current config file
rm -rf ~/.wgetrc

# Symlink config
ln -s ~/dotfiles/wgetrc ~/.wgetrc
```

### Aria2

```shell
# Remove current config folder
rm -rf ~/.aria2

# Symlink config
ln -s ~/dotfiles/aria2 ~/.aria2
```

## Stuff you might wanna use

- [`fzf`](https://github.com/junegunn/fzf) Fuzzy finder
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) Much faster ack
- [`z`](https://github.com/rupa/z) Quickly jump around folders
- [`bat`](https://github.com/sharkdp/bat) Cat with syntax highlight
- [`lf`](https://github.com/gokcehan/lf) Ranger but faster
- [`diff-so-fancy`](https://github.com/so-fancy/diff-so-fancy) Better `git diff`
- [`icdiff`](https://github.com/jeffkaufman/icdiff) Quick replacement for `diff`
- [`delta`](https://github.com/dandavison/delta) syntax-highlighting pager for `git`, `diff`, and `grep` output
- [`up`](https://github.com/akavel/up) Every piper's dream
- [`tig`](https://github.com/jonas/tig) ncurses interface for `git`
- [`tmuxp`](https://github.com/tmux-python/tmuxp) tmux session manager
- [`duf`](https://github.com/muesli/duf) duf is like htop for disk usage
- [`lfs`](https://github.com/Canop/lfs) Filesystems listing like `df -h`
- [`starship-rs`](https://starship.rs/) The minimal, blazing-fast, and infinitely customizable prompt for any shell
- [`zsh-snap`](https://github.com/marlonrichert/zsh-snap) zsh light-weight plugin manager
- [`bandwhich`](https://github.com/imsnif/bandwhich) CLI utility for displaying current network utilization
- [`sd`](https://github.com/chmln/sd) - Quick replacement for `sed`. Find & replace CLI
- [`fd`](https://github.com/sharkdp/fd) - Quick replacement for `find`. Find entries in your filesytem
- [`exa`](https://github.com/ogham/exa) - modern replacement for `ls`
