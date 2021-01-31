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

## Git Hooks

### Commit Message Conventions

The [commit conventions document](./gitmessage) serves as a template for git commit messages.

For information on Semantic Versioning conventions, [see the spec](https://semver.org/#semantic-versioning-specification-semver).

#### Commit messages should adhere to the following conventions:

```sh
# Header - mandatory
type(optional scope): Short description
^..................^: ^...............^
│   * Less than 60 characters
│   * Present tense
│   * Concise
│   * Ex: 'docs: correct spelling of CHANGELOG'
│
└── Contains one of the following:
    * feat             A new feature - SemVar PATCH
    └── MUST coincide with 0.0.x patch version
    * fix              A bug fix - SemVar MINOR
    └── MUST coincide with 0.x.0 minor version
    * BREAKING CHANGE  Breaking API change - SemVar MAJOR
    └── MUST coincide with x.0.0 major version, MUST include
        ! before colon e.g., 'BREAKING CHANGE!: message'
    * docs             Change to documentation only
    * style            Change to style (whitespace, etc.)
    * refactor         Change not related to a bug or feat
    * perf             Change that affects performance
    * test             Change that adds/modifies tests
    * build            Change to build system
    * ci               Change to CI pipeline/workflow
    * chore            General tooling/config/min refactor

# Body - optional
Free form structure. Introduces motivation behind changes
and/or more detailed information

# Footer - optional
word-token: string value
          OR
word-token #string value
^.........^: ^.........^
Consequences of the change(s), such as related issues resolved
by commit, etc. 'word-token' must not contain whitespace.

```

#### Complete example
```sh
# ----------------------------------------------------------
# Header - type(scope): Brief description
# ----------------------------------------------------------
#    * feat             A new feature - SemVar PATCH
#    * fix              A bug fix - SemVar MINOR
#    * BREAKING CHANGE  Breaking API change - SemVar MAJOR
#    * docs             Change to documentation only
#    * style            Change to style (whitespace, etc.)
#    * refactor         Change not related to a bug or feat
#    * perf             Change that affects performance
#    * test             Change that adds/modifies tests
#    * build            Change to build system
#    * ci               Change to CI pipeline/workflow
#    * chore            General tooling/config/min refactor
# ----------------------------------------------------------
docs: Update README with contributing instructions

# ----------------------------------------------------------
# Body - More detailed description, if necessary
# ----------------------------------------------------------
#   * Motivation behind changes, more detail into how 
# functionality might be affected, etc.
# ----------------------------------------------------------
Adds a CONTRIBUTING.md with PR best practices, code style 
guide, and code of conduct for contributors.

# ----------------------------------------------------------
# Footer - Associated issues, PRs, etc.
# ----------------------------------------------------------
#   * Ex: Resolves Issue #207, see PR #15, etc.
# ----------------------------------------------------------
Closes #9
```
