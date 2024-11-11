if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# From https://unix.stackexchange.com/a/273863/324980
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt EXTENDED_HISTORY       # Write the history file in the ":start:elapsed;command" format.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# I have a custom "l" command I built
DISABLE_LS_COLORS="true"

# Display ISO date in the "history" command
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  zsh-vi-mode
  zsh-autosuggestions
)

# Skip aliases
zstyle ':omz:lib:bzr' aliases no
zstyle ':omz:lib:diagnostics' aliases no
zstyle ':omz:lib:directories' aliases no
zstyle ':omz:lib:key-bindings' aliases no

# Disable checks for update on startup of each shell - I do it in a scheduled
# job instead. This reduces startup time by 7ms.
zstyle ':omz:update' mode disabled

ZSH_CUSTOM="${HOME}/site/git/dotfiles/zsh/custom"
source $ZSH/oh-my-zsh.sh
source ~/.p10k.zsh

eval "$(fnm env --shell zsh --corepack-enabled)"

