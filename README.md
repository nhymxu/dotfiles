# dotfiles

Load zsh custom config

```shell
[ -f ~/dotfiles/shell/zsh.sh ] && source ~/dotfiles/shell/zsh.sh
```

Install vim

```shell
echo '
set runtimepath=~/dotfiles/vim,\$VIMRUNTIME
source ~/dotfiles/vim/init.vim
helptags ~/dotfiles/vim/docs' > ~/.vimrc
```

Install neovim

```shell
mkdir -p ~/.config/nvim
echo '
set runtimepath=~/dotfiles/vim,\$VIMRUNTIME
source ~/dotfiles/vim/init.vim
helptags ~/dotfiles/vim/docs' > ~/.config/nvim/init.vim
```

Install nano

```shell
cp ~/dotfiles/nano/nanorc.sample ~/.nanorc
```

Install git

```shell
# Install diff-so-fancy
curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -o ~/bin/diff-so-fancy
chmod +x ~/bin/diff-so-fancy

# Install git config
rm -rf ~/.gitconfig && rm -rf ~/.gitignore_global
ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/dotfiles/git/gitignore ~/.gitignore_global

# Copy example content for local config and edit this
cp ~/dotfiles/git/local.example ~/.gitconfig_local
```
