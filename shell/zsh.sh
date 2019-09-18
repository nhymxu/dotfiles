platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='macos'
fi

DOTFILES_DIR=$HOME/dotfiles
DOTFILES_SHELL_DIR=$DOTFILES_DIR/shell

#if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # ...
#elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
#elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
#elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
#elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
#elif [[ "$OSTYPE" == "freebsd"* ]]; then
        # ...
#else
        # Unknown.
#fi



if [[ $platform == 'linux' ]]; then
    [ -f ${DOTFILES_SHELL_DIR}/linux.sh ] && source ${DOTFILES_SHELL_DIR}/linux.sh
elif [[ $platform == 'macos' ]]; then
    [ -f ${DOTFILES_SHELL_DIR}/macos.sh ] && source ${DOTFILES_SHELL_DIR}/macos.sh
fi

[ -f ${DOTFILES_SHELL_DIR}/alias.sh ] && source ${DOTFILES_SHELL_DIR}/alias.sh

function pip_upgrade() {
    pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
    # pip install -U `pip list --format=columns --outdated | awk '!/Package|---/{ print $1}'`
}

function gitdeploy() {
    if [ -z "$1" ]; then
        echo "Usage: $0 [version or branch]";
        return;
    fi

    echo "Fetching remote data..."
    git fetch -v;
    echo "Stash on hard reset repo"
    git stash && git reset --hard $1 && git stash pop;
    echo "Deploy $1 success"
}

command_exists () {
    type "$1" &> /dev/null ;
}

source ${DOTFILES_SHELL_DIR}/history.zsh

# Fix gpg: signing failed: Inappropriate ioctl for device
export GPG_TTY=$(tty)

export COMPOSER_DISABLE_XDEBUG_WARN=1

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's local bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's cargo bin if it exists
if [ -d "$HOME/.pyenv/bin" ] ; then
    PATH="$HOME/.pyenv/bin:$PATH"
fi



if hash pyenv 2>/dev/null; then
    eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"
fi

export PIPENV_VENV_IN_PROJECT=1

if hash pipenv 2>/dev/null; then
    eval "$(pipenv --completion)"
fi