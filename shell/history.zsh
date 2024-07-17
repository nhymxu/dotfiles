## History Options

# History control. Don't bother with history if we can't write to the file,
# like if we're using sudo.
# if [ -w ~/.zsh_history -o -w ~ ]; then

    # Append rather than overwrite the history on disk
    # shopt -s histappend

    ## History command configuration
    setopt_if_exists EXTENDED_HISTORY       # record timestamp of command in HISTFILE
    setopt_if_exists INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
    setopt_if_exists SHARE_HISTORY          # share command history data between all sessions
    setopt_if_exists HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
    setopt_if_exists HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
    setopt_if_exists HIST_IGNORE_SPACE      # ignore commands that start with space
    setopt_if_exists HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
    setopt_if_exists HIST_VERIFY           # Do not execute immediately upon history expansion. show command with history expansion to user before running it
    setopt_if_exists APPEND_HISTORY        # append to history file (Default)
    setopt_if_exists hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
    setopt_if_exists hist_find_no_dups       # ignore duplicated commands history when find
    setopt_if_exists HIST_NO_STORE          # Don't store history commands
    setopt_if_exists HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.

    # Add timestamp to history file
    export HISTTIMEFORMAT="%d/%m/%y %T "
    # HIST_STAMPS="yyyy-mm-dd"

    # Don't put duplicate lines in the history.
    # export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoreboth:erasedups

    export SAVEHIST=1000000
    export HISTSIZE=1000000
    export HISTFILESIZE=1000000

    # Ignore some controlling instructions
    # HISTIGNORE is a colon-delimited list of patterns which should be excluded.
    #         The '&' is a special pattern which suppresses duplicate entries.
    export HISTIGNORE=$'[ \t]*:&:[fb]g:pwd:exit:fg:bg:top:ls:uptime:df:clear:composer:pip:poetry:git:history*'
    # HISTORY_IGNORE="(ls|pwd|cd)*"

    # Export history to a different file
    # export HISTFILE="${HOME}/.history/${CURRENT_SHELL}.history.txt"
    export HISTFILE="$HOME/.zsh_history"
#fi
