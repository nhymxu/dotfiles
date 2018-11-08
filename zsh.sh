platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='macos'
fi



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
    [ -f ~/dotfiles/bash/linux.sh ] && source ~/dotfiles/bash/linux.sh
elif [[ $platform == 'macos' ]]; then
    [ -f ~/dotfiles/bash/macos.sh ] && source ~/dotfiles/bash/macos.sh
fi

[ -f ~/dotfiles/alias.sh ] && source ~/dotfiles/alias.sh

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

export COMPOSER_DISABLE_XDEBUG_WARN=1
export PATH=~/.local/bin:~/.pyenv/bin:$PATH

if hash pyenv 2>/dev/null; then
    eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"
fi

export PIPENV_VENV_IN_PROJECT=1

if hash pipenv 2>/dev/null; then
    eval "$(pipenv --completion)"
fi
