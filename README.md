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

### Load zsh custom config

```shell
[ -f ~/dotfiles/shell/zsh.sh ] && source ~/dotfiles/shell/zsh.sh
```

### Install vim

```shell
echo '
set runtimepath=~/dotfiles/vim,\$VIMRUNTIME
source ~/dotfiles/vim/init.vim
helptags ~/dotfiles/vim/docs' > ~/.vimrc
```

### Install neovim

```shell
mkdir -p ~/.config/nvim
echo '
set runtimepath=~/dotfiles/vim,\$VIMRUNTIME
source ~/dotfiles/vim/init.vim
helptags ~/dotfiles/vim/docs' > ~/.config/nvim/init.vim
```

### Install nano

```shell
cp ~/dotfiles/nano/nanorc.sample ~/.nanorc
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

## Stuff you might wanna use

- [`fzf`](https://github.com/junegunn/fzf) Fuzzy finder
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) Much faster ack
- [`z`](https://github.com/rupa/z) Quickly jump around folders
- [`bat`](https://github.com/sharkdp/bat) Cat with syntax highlight
- [`lf`](https://github.com/gokcehan/lf) Ranger but faster
- [`diff-so-fancy`](https://github.com/so-fancy/diff-so-fancy) Better git diffs
- [`icdiff`](https://github.com/jeffkaufman/icdiff) Quick replacement for `diff`
- [`up`](https://github.com/akavel/up) Every piper's dream
- [`tig`](https://github.com/jonas/tig) ncurses interface for `git`
