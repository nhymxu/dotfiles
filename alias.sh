# alias pip_upgrade="pip install -U `pip list --format=columns --outdated | awk '!/Package|---/{ print $1}'`"
alias prp="pipenv run python"
