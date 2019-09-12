# dotfiles

Load zsh custom config

```shell
[ -f ~/dotfiles/bash/zsh.sh ] && source ~/dotfiles/bash/zsh.sh
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
cp ~/dotfiles/nano/nanorc ~/.nanorc
```
