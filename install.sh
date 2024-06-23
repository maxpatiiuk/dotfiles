echo WARNING!
echo Read the contents of this file carefully before running it

PWD="${HOME}/site/git/dotfiles"

if [ "$(uname 2> /dev/null)" = "Linux" ]; then
  echo Clearing desktop wallpaper
  gsettings set org.gnome.desktop.background picture-uri ""
  gsettings set org.gnome.desktop.background primary-color "#222222"

  echo Installing essential dependencies
  sudo apt-get upgrade
  sudo apt-get autoremove
  sudo apt-get autoclean
  sudo apt-get install \
    curl \
    git \
    build-essential \
    wget \
    nodejs \
    npm \
    vim-gtk3 \
    pre-commit \
    screen \
    openvpn \
    openssh-server \
    pinentry-curses \
    libreadline6 \
    libreadline6-dev \
    libreadline-dev \
    bzip2 \
    ruby-rubygems

  echo Installing pyenv
  curl https://pyenv.run | bash
  exec $SHELL

  echo Installing Docker
  sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io
  sudo groupadd docker
  sudo usermod -aG docker $USER
  newgrp docker
  sudo systemctl enable docker.service
  sudo systemctl enable containerd.service
  curl -L https://raw.githubusercontent.com/docker/compose-cli/main/scripts/install/install_linux.sh | sh

  echo Configuring SSH
  sudo ufw allow ssh
  sudo systemctl enable ssh

  echo Installing ZSH
  sudo apt install zsh

  echo Hard linking misc files
  sudo ln /usr/bin/gpg /usr/local/bin/gpg
  sudo ln /usr/bin/vim /usr/local/bin/vim
  PINETRY_LOCATION=$(which pinentry-curses)

elif [ "$(uname 2> /dev/null)" = "Darwin" ]; then

  echo Install xcode Developer Tools
  xcode-select --install

  echo Install Homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew update
  brew doctor
  brew tap homebrew/cask-versions

  echo Install Homebrew Formulae and Casks
  brew install curl
  brew install wget
  brew install git
  brew install nvm
  brew install neovim
  brew install pre-commit
  brew install openvpn
  brew install ffmpeg
  brew install pyenv
  brew install pyenv-virtualenv
  brew install gnupg
  brew install pinentry-mac
  brew install coreutils
  brew install grep
  brew install openssh
  brew install screen
  brew install terminal-notifier
  brew install yt-dlp
  brew install macos-trash
  # Used by Raycast
  brew install bitwarden-cli
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
  brew install --cask jetbrains-toolbox
  brew install --cask vnc-viewer
  brew install --cask transmission
  brew install --cask raycast

  # These are needed to make pyenv work on m1 macs
  brew install openssl readline sqlite3 xz zlib

  # Set macOS defaults
  "${PWD}./macos.sh"

  # For silicon macs
  PINETRY_LOCATION="/opt/homebrew/bin/pinentry-mac"

  # For Intel macs
  # PINETRY_LOCATION="/usr/local/bin/pinentry-mac"

else

  echo "Invalid system name"
  exit 1
fi

echo Adding shortcut for Downloads directory
ln -s "${HOME}/Downloads" "${HOME}/d"

echo Creating directories
mkdir -p "${HOME}/site/git"
mkdir -p "${HOME}/site/python"
mkdir -p "${HOME}/site/javascript"

echo Cloning Git repos
(
  cd "${HOME}/site/python"
  git clone https://github.com/specify/specify7.git
  git clone https://github.com/maxpatiiuk/dir-explorer.git
)
(
  cd "${HOME}/site/git"
  git clone https://github.com/specify/specify-tools.git
  git clone https://github.com/maxpatiiuk/custom-new-tab-page.git
  git clone https://github.com/maxpatiiuk/code-share.git
  git clone https://github.com/maxpatiiuk/pre-commit.git
  git clone https://github.com/maxpatiiuk/dotfiles.git
)
(
  cd "${HOME}/site/javascript"
  git clone https://github.com/maxpatiiuk/max.patii.uk.git
  git clone https://github.com/maxpatiiuk/tts-reader.git
)

echo Configure GNU PGP
mkdir -p ~/.gnupg
echo 'use-agent' > ~/.gnupg/gpg.conf
chmod -R 700 ~/.gnupg
echo "pinentry-program ${PINETRY_LOCATION}" >> ~/.gnupg/gpg-agent.conf
killall gpg-agent

echo Installing Node.js
nvm install 20

echo Installing Python 3.11
pyenv install 3.11
pyenv global 3.11
pyenv version
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

echo Install global Python dependencies
pip install wheel

echo Install global NPM dependencies
npm install -g npm-check-updates
npm install -g clipboardy
npm install -g typescript-language-server

echo Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo Deleting default oh-my-zsh configs
rm "${HOME}/.oh-my-zsh/lib/bzr.zsh"
rm "${HOME}/.oh-my-zsh/lib/diagnostics.zsh"
rm "${HOME}/.oh-my-zsh/lib/directories.zsh"
rm "${HOME}/.oh-my-zsh/lib/key-bindings.zsh"

echo Installing Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${PWD}/zsh/custom/themes/powerlevel10k

echo Installing other ZSH plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${PWD}/zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/jeffreytse/zsh-vi-mode "${PWD}/zsh/custom/plugins/zsh-vi-mode"

echo Replacing the default Git Config
rm -f "${HOME}/.gitconfig"
ln -s "${PWD}/git/.gitconfig" "${HOME}"

echo Configuring Vim
rm -f "${HOME}/.vimrc"
rm -rf "${HOME}/.vim"
rm -rf "${HOME}/.vim/spell"
mkdir -p "${HOME}/.vim/undo"
mkdir -p "${HOME}/.vim/backups"
mkdir -p "${HOME}/.vim/swaps"
ln "${PWD}/vim/.vimrc" "${HOME}"
ln "${PWD}/vim/.ideavimrc" "${HOME}"
ln -s "${PWD}/vim/spell" "${HOME}/.vim/"

echo Hard linking misc files
rm -f "${HOME}/.zshrc"
ln -s "${PWD}/zsh/.zshrc" "${HOME}"
rm -f "${HOME}/zsh/.zprofile"
ln -s "${PWD}/zsh/.zprofile" "${HOME}"
rm -f "${HOME}/.p10k.zsh"
ln -s "${PWD}/zsh/.p10k.zsh" "${HOME}"
ln "${PWD}/zsh/.screenrc" "${HOME}"
ln "${PWD}/misc/.editorconfig" "${HOME}/site"
sudo mkdir -p "/etc/docker/"
sudo ln "${PWD}/docker/daemon.json" "/etc/docker/"

echo Hard linking common files from \`code-share\`
ln "${HOME}/site/git/code-share/misc/images/mambo.jpg" "${HOME}/Documents/"
ln "${HOME}/site/git/code-share/misc/images/max_patiiuk_old.jpg" "${HOME}/Documents/"
ln "${HOME}/site/git/code-share/misc/images/max_patiiuk_1x1.jpg" "${HOME}/Documents/"
ln "${HOME}/site/git/code-share/misc/images/max_patiiuk.jpg" "${HOME}/Documents/"
ln "${HOME}/site/git/code-share/misc/images/wolf.jpg" "${HOME}/Documents/"

echo Initializing Dir Explorer
(
  cd "${HOME}/site/python/dir-explorer"
  python -m venv venv
  venv/bin/pip install -r requirements.txt
)

echo Initializing TTS Utility
(
  cd "${HOME}/site/javascript/tts-reader"
  npm i
)

echo Installing Docker Watcher
(
  cd "${HOME}/site/git/specify-tools/docker_container"
  python -m venv venv
  venv/bin/pip install -r requirements.txt
)

if [ "$(uname 2> /dev/null)" = "Darwin" ]; then
  echo Hard linking launchctl .plist file
  mkdir -p ${HOME}/Library/LaunchAgents/
  ln "${PWD}/scripts/uk.patii.max.task.plist" "${HOME}/Library/LaunchAgents/"

  echo Change VS Code Icon
  mv "/Applications/Visual Studio Code.app/Contents/Resources/Code.icns" "/Applications/Visual Studio Code.app/Contents/Resources/Code_original.icns"
  cp "./vscode/icon.icns" "/Applications/Visual Studio Code.app/Contents/Resources/Code.icns"
fi

echo \#\#\# Private part \#\#\#
echo This relies on a private \`maxpatiiuk/private-dotfiles\` repository
echo You should comment out this part or replace it with your own
echo private repository

(
  cd "${HOME}/site/git/"
  git clone https://github.com/maxpatiiuk/private-dotfiles.git
  cd private-dotfiles
  ./install.sh
)
