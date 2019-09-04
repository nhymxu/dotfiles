:# dotfiles

Load zsh custom config
```
[ -f ~/dotfiles/bash/zsh.sh ] && source ~/dotfiles/bash/zsh.sh
```

Install vim
```
echo '
set runtimepath=~/dotfiles/vim,\$VIMRUNTIME
source ~/dotfiles/vim/init.vim
helptags ~/dotfiles/vim/docs' > ~/.vimrc
```

Install neovim
```
mkdir -p ~/.config/nvim
echo '
set runtimepath=~/dotfiles/vim,\$VIMRUNTIME
source ~/dotfiles/vim/init.vim
helptags ~/dotfiles/vim/docs' > ~/.config/nvim/init.vim
```
