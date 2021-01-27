## History Options

# History control. Don't bother with history if we can't write to the file,
# like if we're using sudo.
if [ -w ~/.zsh_history -o -w ~ ]; then

    # Append rather than overwrite the history on disk
    # shopt -s histappend

    ## History command configuration
    setopt extended_history       # record timestamp of command in HISTFILE
    setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
    setopt hist_ignore_dups       # ignore duplicated commands history list
    setopt hist_ignore_space      # ignore commands that start with space
    setopt hist_verify            # show command with history expansion to user before running it
    setopt share_history          # share command history data

    # Add timestamp to history file
    export HISTTIMEFORMAT="%d/%m/%y %T "

    # Don't put duplicate lines in the history.
    export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoreboth:erasedups

    SAVEHIST=100000
    HISTSIZE=100000

    # Ignore some controlling instructions
    # HISTIGNORE is a colon-delimited list of patterns which should be excluded.
    #         The '&' is a special pattern which suppresses duplicate entries.
    export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls:clear'

    # Export hostory to a different file
    # export HISTFILE="${HOME}/.history/${CURRENT_SHELL}.history.txt"
    export HISTFILE=~/.zsh_history
fi
