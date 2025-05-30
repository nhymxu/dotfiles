# alias pip_upgrade="pip install -U `pip list --format=columns --outdated | awk '!/Package|---/{ print $1}'`"
alias prp="pipenv run python"
weather() { curl -4 wttr.in/${1:-hanoi} }

# exa:
alias ela="exa -abghl --git"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, excluding . and ..
alias la="ls -lAF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# Show hidden files
alias l.='ls -d .* ${colorflag}'

# Start calculator with math support
alias bc='bc -l'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias whatismyip='curl http://checkip.amazonaws.com'

# alias docker_start_all="docker start $(docker ps -a -q)"
alias docker_start_all="docker ps -a -q | xargs -n1 docker start"

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

function dowload-m3u8() {
    if [ -z "$1" ]; then
        echo "Usage: $0 input_file.m3u8 output_file.mp4";
        return;
    fi

    ffmpeg -protocol_whitelist file,http,https,tcp,tls -i $1 -c copy $2
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

# Extract most know archives with one command
function extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2) tar xjf $1 ;;
      *.tar.gz) tar xzf $1 ;;
      *.bz2) bunzip2 $1 ;;
      *.rar) unrar e $1 ;;
      *.gz) gunzip $1 ;;
      *.tar) tar xf $1 ;;
      *.tbz2) tar xjf $1 ;;
      *.tgz) tar xzf $1 ;;
      *.zip) unzip $1 ;;
      *.Z) uncompress $1 ;;
      *.7z) 7z x $1 ;;
      *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function extract2() {
    local file="$1";
    if [ -z "$file" ]; then
        printf "\033[1;31mNo file specified\n\033[0m" 1>&2;
        return 1;
    fi;
    if [ ! -f "$file" ]; then
        printf "\033[1;31mFile '%s' not found\n\033[0m" "$file" 1>&2;
        return 1;
    fi;
    local ext="${file#*.}";
    local extractor;
    local options="";
    case "$ext" in
        tar.bz2 | tbz2 | tar)
            extractor="tar";
            options="xvf"
        ;;
        tar.gz | tgz)
            extractor="tar";
            options="xzvf"
        ;;
        tar.xz)
            extractor="tar";
            options="Jxvf"
        ;;
        bz2)
            extractor="bunzip2"
        ;;
        rar)
            extractor="unar";
            options="-d"
        ;;
        gz)
            extractor="gunzip"
        ;;
        zip)
            extractor="unzip"
        ;;
        xz)
            extractor="unxz"
        ;;
        7z)
            extractor="7z";
            options="x"
        ;;
        Z)
            extractor="uncompress"
        ;;
        *)
            printf "\033[1;31mUnsupported file type: %s\n\033[0m" "$file" 1>&2;
            return 1
        ;;
    esac;
    if ! "$extractor" $options "$file"; then
        printf "\033[1;31mError extracting '%s'\n\033[0m" "$file" 1>&2;
        return 1;
    fi
}

# Test timing for various stages of an HTTP connection to a domain
function curl_time() {
  curl -so /dev/null -w "\
   namelookup:  %{time_namelookup}s\n\
      connect:  %{time_connect}s\n\
   appconnect:  %{time_appconnect}s\n\
  pretransfer:  %{time_pretransfer}s\n\
     redirect:  %{time_redirect}s\n\
starttransfer:  %{time_starttransfer}s\n\
-------------------------\n\
        total:  %{time_total}s\n" "$@"
}

# working with tar archives
alias ltar="tar -ztvf"
alias untar="tar -zxvf"
alias atar="tar -cvzf"

function video_thumbnail() {
  if [ -z "$1" ]; then
    echo "Usage: $0 input_file.m3u8 output_file.mp4";
    return;
  fi

  if [ ! -f "$1" ]; then
    echo "Input file $1 not found";
    return;
  fi

  ffmpeg -i $1 -frames:v 1 ${1%.*}.png
}

alias jobs_kill_all="jobs -p | xargs kill"

function listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

alias docker-clean="docker system prune -f"

# Reload zshrc file to apply changes.
# Allows you to not need to restart terminal for changes to .zshrc to be applied
alias reload='source ~/.zshrc'

function asdf-alias() {
    local plugin_name=$1
    local version=$2
    local target_version=$3

    if [ -z "$plugin_name" ] || [ -z "$version" ] || [ -z "$target_version" ]; then
        echo "Usage example:";
        echo "  Create 3.12 version using 3.12.8";
        echo "      asdf-alias python 3.12.8 3.12";
        return;
    fi

    mkdir -p ~/.asdf/installs/$plugin_name/$target_version

    folder_list=(bin include lib share)
    for i in "${folder_list[@]}"
    do
        ln -s ~/.asdf/installs/$plugin_name/$version/$i ~/.asdf/installs/$plugin_name/$target_version/$i
    done
}

function asdf-shell() {
    local plugin_name=$1
    local version=$2

    if [ -z "$plugin_name" ] || [ -z "$version" ]; then
        echo "Usage example:";
        echo "  Using Python 3.12 in the current shell session";
        echo "      asdf-shell python 3.12";
        return;
    fi

    local plugin_name_formated=$(echo $plugin_name | tr '[:lower:]' '[:upper:]')
    # local plugin_name_formated=$(echo "$plugin_name" | awk '{print toupper($0)}')

    export "ASDF_${plugin_name_formated}_VERSION"="$version"
}

gt() {
	gitpath=$(echo "$HOME/work/")
    # gitpath="$(cd "$gitpath_rel" && pwd -P)"
	repopath=$(find ${gitpath} -mindepth 2 -maxdepth 2 -type d | awk -F $gitpath '{print $2}' | fzf)
	if [ -n "$repopath" ]; then
		cd ${gitpath}${repopath} || echo "Failed to navigate to ${gitpath}${repopath}"
	else
		echo "No repository selected."
	fi
}


tunnel_ssh() {
    LOCAL_PORT=$1
    REMOTE_HOST=$2
    REMOTE_PORT=$3
    HOST_NAME=$(ssh -v $REMOTE_HOST ' ' 2>&1 | grep '^debug1: Connecting to' | cut -d [ -f 2 | sed "s/\]//")
    echo "Connected to ${HOST_NAME}"
    echo "Now, forwarding all traffic from our local $LOCAL_PORT port to its internal $REMOTE_PORT port"
    ssh -L "$LOCAL_PORT":127.0.0.1:"$REMOTE_PORT" "$REMOTE_HOST" -N
}
