#!/bin/zsh

date
echo 🔵 A weekly launchctl task that does various maintenance tasks

echo 🔵 Maintaining Homebrew
/opt/homebrew/bin/brew update
/opt/homebrew/bin/brew upgrade
/opt/homebrew/bin/brew upgrade --cask
/opt/homebrew/bin/brew cleanup
/opt/homebrew/bin/brew doctor

echo 🔵 Updating oh-my-zsh
"$ZSH/tools/upgrade.sh"

echo 🔵 Updating PowerLevel10k
git -C ../zsh/custom/themes/powerlevel10k pull

echo 🔵 Updating npm
npm install npm -g
npm update -g

echo 🔵 Updating rust
rustup update

echo 🔵 Exit