# See https://unix.stackexchange.com/a/273863/324980

HISTSIZE=1000000
SAVEHIST=1000000

# I use Ctrl + R instead
# alias history="builtin fc -i -l"

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
setopt hist_find_no_dups      # Do not display a line previously found.
setopt hist_reduce_blanks     # Remove superfluous blanks before recording entry.
