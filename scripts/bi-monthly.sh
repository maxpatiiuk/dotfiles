#!/bin/zsh

echo A bi-monthly launchctl task that does various maintenance tasks

echo Updating pre-commit hooks
/usr/local/bin/pre-commit autoupdate --config ~/site/git/dotfiles/git/.pre-commit-config.yaml
/usr/local/bin/pre-commit gc

echo Maintaining Homebrew
/usr/local/bin/brew update
/usr/local/bin/brew upgrade
/usr/local/bin/brew cleanup
/usr/local/bin/brew doctor

echo Calling additional scripts
pre_commit_tools_dir="${HOME}/site/git/pre-commit-tools"
"${pre_commit_tools_dir}/venv/bin/python" "${pre_commit_tools_dir}/pre-commit-tools/update_hooks.py"

echo Exit
