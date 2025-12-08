typeset -F SECONDS
START_TIME=$SECONDS

#region Completions
# Disable /etc/zshrc lookup
SKIP_GLOBAL_COMPINIT=1
# Scan $fpath and build .zcompdump cache
autoload -Uz compinit zrecompile
# Check if cache is out of date at most once per day
if () { setopt local_options extendedglob; [[ -z "${ZDOTDIR}/cache/.zcompdump"(#qN.mh+24) ]] }; then
  # If the compdump was modified less than 24 hours ago, use the cached compdump, disable autodump
  compinit -C -d "${ZDOTDIR}/cache/.zcompdump" -D
else
  # If the user wants it, load from all found directories
  compinit -u -d "${ZDOTDIR}/cache/.zcompdump"
  # update the timestamp on compdump file
  compdump
  # Turn plaintext cache into binary for faster loading
  # -p - keep plaintext to avoid re-compiling every time
  zrecompile -q -p "${ZDOTDIR}/cache/.zcompdump"
fi
# Cache command-level completions
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "${ZDOTDIR}/cache"
# Enable fancier completion list (TODO: test what difference it makes)
zmodload -i zsh/complist
zstyle ':completion:*:*:*:*:*' menu select
# Auto-open completions menu when there are multiple options
setopt auto_menu
# Allow completion anywhere in the line
setopt complete_in_word
# Move cursor to end after completion
setopt always_to_end
# Disable unused feature & keybindings
unsetopt flowcontrol
# Inherit ls colors for file completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Normalize-away double slashes during completion
zstyle ':completion:*' squeeze-slashes true
# When completing parent directories, exclude current directory to reduce noise
zstyle ':completion:*' ignore-parents parent pwd
#endregion

#region Aliases & Functions
source "${ZDOTDIR}/custom/directories.zsh"
source "${ZDOTDIR}/custom/docker.zsh"
source "${ZDOTDIR}/custom/esri.zsh"
source "${ZDOTDIR}/custom/git.zsh"
source "${ZDOTDIR}/custom/grep.zsh"
source "${ZDOTDIR}/custom/history.zsh"
source "${ZDOTDIR}/custom/macos.zsh"
source "${ZDOTDIR}/custom/misc.zsh"
source "${ZDOTDIR}/custom/programs.zsh"
source "${ZDOTDIR}/custom/specify.zsh"
source "${ZDOTDIR}/custom/zsh-vi-mode.zsh"
source "${ZDOTDIR}/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${ZDOTDIR}/custom/plugins/zsh-vi-mode/zsh-vi-mode.zsh"
#endregion

# Ignore comments in interactive shell
setopt interactivecomments

# Enable fast pure-like prompt
source "${ZDOTDIR}/prompt.zsh"

eval "$(fnm env --shell zsh --corepack-enabled)"

END_TIME=$SECONDS
DURATION=$(awk "BEGIN { print $END_TIME - $START_TIME }")
echo "Execution time: ${DURATION} seconds"