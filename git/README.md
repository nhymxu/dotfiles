# Git alias

## git p

```shell
p = "!git pull --ff-only"
```

This is a simple alias which performs a `git pull --ff-only`. I can run `git p` in any repository to ensure I always have the latest version of that branch without accidentally creating extra merge commits.

## gix fixup <commit>

```shell
fixup = !sh -c 'REV=$(git rev-parse $1) && git commit --fixup $@ && git rebase -i --autostash --autosquash $REV^' -
```

This one is probably my favorite - it automates the process of amending any previous commit with the currently-staged changes. For example, if I need to amend the commit before the current one, I can simply run something like this:

```shell
vi somefile.ext
git add somefile.ext
git fixup HEAD^
```

Any commit or "tree-ish" should work for the argument: `HEAD~2`, `abcd123`, `feature/foobar`, etc.

## git cleanup

```shell
cleanup = "!git branch --merged | grep -v -P '^\\*|master|develop' | xargs -n1 -r git branch -d"
```

This command will delete all local branches which have been merged into the current branch, except those named master and develop which it'll never delete. It's an easy way to keep your local repo clean.

Source: https://stackoverflow.com/questions/6127328/how-can-i-delete-all-git-branches-which-have-been-merged#comment76417273_21857717

## git children

```shell
children = "!bash -c 'c=${1:-HEAD}; set -- $(git rev-list --all --not \"$c\"^@ --children | grep $(git rev-parse \"$c\") ); shift; echo $1' -"
```

Git commits are directly tied to their parents, making it easy to navigate backwards through the history. But what if you've checked out some random commit and want to move forwards instead? `git children` will identify all known commits which have the current `HEAD` as their parent!

## git lg

```shell
!git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit
```

clean log view

## git ignored

```shell
!git ls-files --others --i --exclude-standard
```

Show what files are being ignored in the repo

## git log with list of changed files for each commit

```shell
log --stat --abbrev-commit
```

## Cancel local commits in the branch: git fuck master

```shell
!f() { git reset --hard origin/$1; }; f
```

## Rename stash

```log
$ git stash list
stash@{0}: On master: Pep8 format
stash@{1}: On master: co other than master with local changes
stash@{2}: On master: tests with deployAtEnd

# Let's say I want to rename the stash@{2} adding an issue reference:
$ git stash-rename stash@{2} NXP-13971-deployAtEnd

$ git stash list
stash@{0}: On master: NXP-13971-deployAtEnd
stash@{1}: On master: Pep8 format
stash@{2}: On master: co other than master with local changes
```
