# alias pip_upgrade="pip install -U `pip list --format=columns --outdated | awk '!/Package|---/{ print $1}'`"
alias prp="pipenv run python"
weather() { curl -4 wttr.in/${1:-hanoi} }

# exa:
alias la="exa -abghl --git"

# Show hidden files
alias l.='ls -d .* --color=auto'

# Start calculator with math support
alias bc='bc -l'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

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

rxvt-title() {
  echo -n "]2;$*"
}

screen-title() {
  echo -n "k$*\\"
}

renice_ggbackup() {
    if [ -z "$1" ]; then
        for f in $(pgrep 'Backup and Sync'; pgrep 'FinderSyncAPIExtension'); do renice +20 -p $f; done
        return;
    fi
    
    for f in $(pgrep 'Backup and Sync'; pgrep 'FinderSyncAPIExtension'); do renice +$1 -p $f; done
}

restore_ggbackup () {
    for f in $(pgrep 'Backup and Sync'; pgrep 'FinderSyncAPIExtension'); do renice 0 -p $f; done
}

