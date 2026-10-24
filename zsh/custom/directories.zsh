# Allow directory navigating without cd
setopt auto_cd
# Less verbose pushd/popd
setopt PUSHDSILENT

alias sj="cd ~/j/"
alias sg="cd ~/g/"
alias sc="cd ~/g/code-share/"
alias scc="cd ~/g/code-hole/"
alias sd="cd ~/g/dotfiles/"
alias sdp="cd ~/g/private-dotfiles/"
alias sz="cd ~/g/dotfiles/zsh/custom/"
alias sn="cd ~/g/code-share/misc/notes/"
alias d="cd ~/d/"

# cd to repository root
z() {
  local repository_root
  if ! repository_root=$(git rev-parse --show-toplevel 2>/dev/null); then
    print -u2 -P '%F{red}Error: not in a Git repository.%f'
    return 1
  fi

  builtin cd -- "$repository_root"
}

# cd to nearest package root
zz() {
  local package_root="$PWD"

  while [[ ! -f "$package_root/package.json" ]]; do
    if [[ "$package_root" == / ]]; then
      print -u2 -P '%F{red}Error: no package.json found in this directory or its ancestors.%f'
      return 1
    fi
    package_root=${package_root:h}
  done

  builtin cd -- "$package_root"
}
