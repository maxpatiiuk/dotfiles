#!/usr/bin/env zsh
# Compile .zsh files to binary for faster loading

autoload -Uz zrecompile

zrecompile -p "${ZDOTDIR}/.zshrc"
zrecompile -p "${ZDOTDIR}/.zprofile"
zrecompile -p "${ZDOTDIR}/prompt.zsh"

for file in ${ZDOTDIR}/custom/**/*.zsh; do
  zrecompile -p "$file"
done