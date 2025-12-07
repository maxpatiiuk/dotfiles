#region Completions
# Scan $fpath and build .zcompdump cache
autoload -Uz compinit zrecompile
compinit -u -d "${ZDOTDIR}/cache/.zcompdump"
# Turn plaintext cache to binary for faster loading
zrecompile -q -p "${ZDOTDIR}/cache/.zcompdump"
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

# Ignore comments in interactive shell
setopt interactivecomments

# 🟥 lib
source "${ZDOTDIR}/custom/directories.zsh"
source "${ZDOTDIR}/custom/dirhistory.sh"
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

# Load powerlevel10k theme
source "${ZDOTDIR}/custom/themes/powerlevel10k/powerlevel10k.zsh-theme"
source "${ZDOTDIR}/.p10k.zsh"

eval "$(fnm env --shell zsh --corepack-enabled)"