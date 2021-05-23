# Configure zsh-vi-mode
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_USER_DEFAULT
ZVM_VI_HIGHLIGHT_BACKGROUND=green


# Custom key bindings
# (default zsh key bindings are reset by the zsh-vi-mode plugin)
function zvm_after_init() {
  source /Users/maxxxxxdlp/site/git/dotfiles/zsh/custom/dirhistory.plugin.zsh

  bindkey "^[[A" history-beginning-search-backward
  bindkey "^[[B" history-beginning-search-forward

}
