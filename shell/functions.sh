# INTERNAL UTILITY FUNCTIONS {{{1

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 &>/dev/null )
}

# Returns whether the given statement executed cleanly. Try to avoid this
# because this slows down shell loading.
_try() {
  return $( eval $* &>/dev/null )
}

# Returns whether the current host type is what we think it is. (HOSTTYPE is
# set later.)
_is() {
  return $( [ "$HOSTTYPE" = "$1" ] )
}

# Returns whether out terminal supports color.
_color() {
  return $( [ -z "$INSIDE_EMACS" ] )
}

# Returns the version of a command if present, or n/a if unavailable.
_versionof() {
  if _has "$1"; then
    echo "$1 $($1 --version)"
  else
    echo "$1 n/a"
  fi
}

# ENVIRONMENT VARIABLES {{{1

# Yes, this defeats the point of the TERM variable, but everything pretty much
# uses modern ANSI escape sequences. I've found that forcing everything to be
# "rxvt" just about works everywhere. (If you want to know if you're in screen,
# use SHLVL or TERMCAP.)
if _color; then
  if [ -n "$ITERM_SESSION_ID" ]; then
    if [ "$TERM" = "screen" ]; then
      export TERM=screen-256color
    else
      export TERM=xterm-256color
    fi
  elif [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
      export TERM=xterm-256color
  else
    export TERM=rxvt
  fi
else
  export TERM=xterm
fi

# Utility variables.
if which hostname &>/dev/null; then
  HOSTNAME=`hostname`
elif which uname &>/dev/null; then
  HOSTNAME=`uname -n`
else
  HOSTNAME=unknown
fi
export HOSTNAME

# HOSTTYPE = { Linux | OpenBSD | SunOS | etc. }
if which uname &>/dev/null; then
  HOSTTYPE=`uname -s`
else
  HOSTTYPE=unknown
fi
export HOSTTYPE

# PAGER
if [ -n "$INSIDE_EMACS" ]; then
  export PAGER=cat
else
  if _has less; then
    export PAGER=less
    if _color; then
      export LESS='-R'
    fi
  fi
fi

# Overridable locale support.
if [ -z $$LC_ALL ]; then
  export LC_ALL=C
fi
if [ -z $LANG ]; then
  export LANG=en_US
fi
