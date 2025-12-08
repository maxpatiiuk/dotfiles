echo 🔴 WARNING!
echo 🔴 Read the contents of this file carefully before running it

PWD="${HOME}/s/git/dotfiles"

# If system is not Darwin, exit with code 1:
if [ "$(uname 2> /dev/null)" != "Darwin" ]; then
  echo 🔴 This install script works only on macOS.
  echo 🔴 Modifications may be required to make it work on other platforms.
  exit 1
fi

echo 🔵 Install xcode Developer Tools
xcode-select --install

echo 🔵 Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew doctor
brew tap homebrew/cask-versions

echo 🔵 Install Homebrew Formulae and Casks
brew install curl
brew install wget
brew install git
brew install git-lfs
# And manually update to 24 in zsh/.zprofile
brew install node24
brew install neovim
brew install ffmpeg
brew install gnupg
brew install pinentry-mac
brew install coreutils
brew install grep
brew install openssh
brew install screen
brew install yt-dlp
brew install awk
brew install macos-trash
brew install gh
brew install rustup
brew install python
brew install --cask iterm2
# WARNING: this would install an Intel version of Docker
brew install --cask docker
# NOTE: at one point browser integration was only available in the
# App Store version of bitwarden - check if that is still the case
brew install --cask bitwarden
brew install --cask google-chrome-beta
brew install --cask firefox-developer-edition
brew install --cask visual-studio-code
brew install --cask vlc
brew install --cask obs
brew install --cask surfshark
brew install --cask zoom
brew install --cask vnc-viewer
brew install --cask transmission
brew install --cask raycast

# Set macOS defaults
"${PWD}./macos.sh"

# For silicon macs
PINETRY_LOCATION="/opt/homebrew/bin/pinentry-mac"

# For Intel macs
# PINETRY_LOCATION="/usr/local/bin/pinentry-mac"

echo 🔵 Adding shortcut for Downloads directory
ln -s "${HOME}/Downloads" "${HOME}/d"

echo 🔵 Creating directories
mkdir -p "${HOME}/s/git"
mkdir -p "${HOME}/s/python"
mkdir -p "${HOME}/s/javascript"

echo 🔵 Cloning Git repos
(
  cd "${HOME}/s/python"
  git clone https://github.com/specify/specify7.git
  git clone https://github.com/maxpatiiuk/dir-explorer.git
)
(
  cd "${HOME}/s/git"
  git clone https://github.com/specify/specify-tools.git
  git clone https://github.com/maxpatiiuk/custom-new-tab-page.git
  git clone https://github.com/maxpatiiuk/code-share.git
  git clone https://github.com/maxpatiiuk/dotfiles.git
)
(
  cd "${HOME}/s/javascript"
  git clone https://github.com/maxpatiiuk/max.patii.uk.git
  git clone https://github.com/maxpatiiuk/text-hoarder.git
)

echo 🔵 Configure GNU PGP
mkdir -p ~/.gnupg
echo 'use-agent' > ~/.gnupg/gpg.conf
chmod -R 700 ~/.gnupg
echo 🔵 "pinentry-program ${PINETRY_LOCATION}" >> ~/.gnupg/gpg-agent.conf
killall gpg-agent

echo 🔵 Installing Rust
rustup default stable

echo 🔵 Install global Python dependencies
pip install wheel

echo 🔵 Installing other ZSH plugins
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${PWD}/zsh/custom/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/jeffreytse/zsh-vi-mode "${PWD}/zsh/custom/plugins/zsh-vi-mode"

echo 🔵 Replacing the default Git Config
ln -sf "${PWD}/git/.gitconfig" "${HOME}"

echo 🔵 Configuring Vim
mkdir -p "${HOME}/.vim/undo"
mkdir -p "${HOME}/.vim/backups"
mkdir -p "${HOME}/.vim/swaps"
ln -sf "${PWD}/vim/.vimrc" "${HOME}"
ln -sf "${PWD}/vim/.ideavimrc" "${HOME}"
ln -sf "${PWD}/vim/spell" "${HOME}/.vim/"

echo 🔵 Linking misc files
ln -sf "${PWD}/zsh/.zshenv" "${HOME}"
ln -sf "${PWD}/zsh/.screenrc" "${HOME}"
sudo mkdir -p "/etc/docker/"
sudo ln "${PWD}/docker/daemon.json" "/etc/docker/"

echo 🔵 Hard linking common files from \`code-share\`
ln "${HOME}/s/git/code-share/misc/images/mambo.jpg" "${HOME}/Documents/"
ln "${HOME}/s/git/code-share/misc/images/max_patiiuk_old.jpg" "${HOME}/Documents/"
ln "${HOME}/s/git/code-share/misc/images/max_patiiuk_1x1.jpg" "${HOME}/Documents/"
ln "${HOME}/s/git/code-share/misc/images/max_patiiuk.jpg" "${HOME}/Documents/"
ln "${HOME}/s/git/code-share/misc/images/wolf.jpg" "${HOME}/Documents/"

echo 🔵 Initializing Dir Explorer
(
  cd "${HOME}/s/python/dir-explorer"
  python -m venv venv
  venv/bin/pip install -r requirements.txt
)

echo 🔵 Initializing Text Hoarder
(
  cd "${HOME}/s/javascript/text-hoarder"
  npm i
)

echo 🔵 Installing Docker Watcher
(
  cd "${HOME}/s/git/specify-tools/docker_container"
  python -m venv venv
  venv/bin/pip install -r requirements.txt
)

echo 🔵 Linking launchctl .plist file
mkdir -p ${HOME}/Library/LaunchAgents/
ln -sf "${PWD}/scripts/uk.patii.max.task.plist" "${HOME}/Library/LaunchAgents/"

echo 🔵 Update VS Code Icon
mv "/Applications/Visual Studio Code.app/Contents/Resources/Code.icns" "/Applications/Visual Studio Code.app/Contents/Resources/Code_original.icns"
cp "./vscode/icon.icns" "/Applications/Visual Studio Code.app/Contents/Resources/Code.icns"

echo 🔴 \#\#\# Private part \#\#\#
echo 🔴 This relies on a private \`maxpatiiuk/private-dotfiles\` repository
echo 🔴 You should comment out this part or replace it with your own
echo 🔴 private repository

(
  cd "${HOME}/s/git/"
  git clone https://github.com/maxpatiiuk/private-dotfiles.git
  cd private-dotfiles
  ./install.sh
)
