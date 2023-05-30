# Configure zsh-vi-mode
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_USER_DEFAULT
ZVM_VI_HIGHLIGHT_BACKGROUND=green

# Custom key bindings
# (default zsh key bindings are reset by the zsh-vi-mode plugin)
function zvm_after_init() {
  source ~/site/git/dotfiles/zsh/custom/dirhistory.plugin.zsh

    bindkey "^[[A" history-beginning-search-backward
    bindkey "^[[B" history-beginning-search-forward

  if [ "$(uname 2>/dev/null)" = "Linux" ]; then
    bindkey "^[[1;3D" backward-word
    bindkey "^[[1;3C" forward-word
    bindkey '^[[1;3A' beginning-of-line
    bindkey '^[[1;3B' end-of-line
  elif [ "$(uname 2>/dev/null)" = "Darwin" ]; then
    bindkey "\e\e[C" backward-word
    bindkey "\e\e[D" forward-word
    bindkey "\e\e[A" beginning-of-line
    bindkey "\e\e[B" end-of-line
  fi

}
