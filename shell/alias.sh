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

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

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
