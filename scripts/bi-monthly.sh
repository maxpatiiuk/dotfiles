#!/bin/zsh

echo A bi-monthly launchctl task that does various maintenance tasks

echo Updating pre-commit hooks
/usr/local/bin/pre-commit autoupdate --config ~/site/git/dotfiles/git/.pre-commit-config.yaml
/usr/local/bin/pre-commit gc

echo Maintaining Homebrew
/opt/homebrew/bin/brew update
/opt/homebrew/bin/brew update --cask
/opt/homebrew/bin/brew upgrade
/opt/homebrew/bin/brew upgrade --cask
/opt/homebrew/bin/brew cleanup
/opt/homebrew/bin/brew doctor

echo Calling additional scripts
pre_commit_tools_dir="${HOME}/site/git/pre-commit-tools"
"${pre_commit_tools_dir}/venv/bin/python" "${pre_commit_tools_dir}/pre-commit-tools/update_hooks.py"

echo Exit