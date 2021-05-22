#!/bin/zsh

echo A bi-monthly launchctl task that does various maintenance tasks

echo Update pre-commit hooks
/usr/local/bin/pre-commit autoupdate --config ~/site/git/dotfiles/git/.pre-commit-config.yaml
/usr/local/bin/pre-commit gc

echo Maintain Homebrew
/usr/local/bin/brew update
/usr/local/bin/brew upgrade
/usr/local/bin/brew cleanup
/usr/local/bin/brew doctor

echo Exit
