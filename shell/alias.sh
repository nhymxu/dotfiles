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
