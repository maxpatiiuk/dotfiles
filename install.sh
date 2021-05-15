echo WARNING!
echo Read the contents of this file carefully before running it

PWD="${HOME}/site/git/dotfiles"

echo Install xcode Developer Tools
xcode-select --install

echo Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew doctor

echo Install Homebrew Formulae and Casks
brew install curl
brew install wget
brew install git
brew install node
brew install vim
brew install macvim
brew link macvim
brew install pre-commit
brew install openconnect
brew install openvpn
brew install pyenv
brew install pyenv-virtualenv
brew install pycharm
brew install docker
brew install docker-compose
brew install make
brew cask install google-chrome-beta
brew cask install firefox-developer-edition
brew cask install vlc
brew cask install obs
brew cask install teamviewer
brew cask install android-file-transfer

echo Install Python 3.9
pyenv install 3.9
pyenv global 3.9
pyenv version

echo Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


echo Create directories
mkdir "${HOME}/site"
mkdir "${HOME}/site/git"
mkdir "${HOME}/site/python"
mkdir "${HOME}/site/javascript"

echo Clone Git repos
(
  cd "${HOME}/site/python" &&
  git clone https://github.com/specify/specify7.git
  git clone https://github.com/specify/open_api_tools.git
  git clone https://github.com/lifemapper/lm_test.git
  git clone https://github.com/maxxxxxdlp/dir_explorer.git
  git clone https://github.com/maxxxxxdlp/python_tts.git
)
(
  cd "${HOME}/site/git" &&
  git clone https://github.com/specify/specify6.git &&
  git clone https://github.com/specify/specify_tools.git &&
  git clone https://github.com/maxxxxxdlp/custom_new_tab_page.git &&
  git clone https://github.com/maxxxxxdlp/code_share.git &&
  git clone https://github.com/maxxxxxdlp/pre-commit.git &&
  git clone https://github.com/maxxxxxdlp/dotfiles.git &&
)
(
  cd "${HOME}/site/javascript" &&
  git clone https://github.com/maxxxxxdlp/TTS_King.git
  git clone https://github.com/maxxxxxdlp/mambo.in.ua.git
  git clone https://github.com/maxxxxxdlp/typesafe-reducer.git
)

echo Replace the default Git Config
# Need an "-f" flag to not error-out if the file does not exist
rm -f "${HOME}/.gitconfig"
# Need to create a symbolic link because of how git misbehaves
ln -s "${PWD}/git/.gitconfig" "${HOME}"

echo Hardlink Misc files
rm -f "${HOME}/.vimrc"
ln "${PWD}/vim/.vimrc" "${HOME}"
ln "${PWD}/misc/.editorconfig" "${HOME}/site"

echo Hardlink common files from \`code_share\`
ln "${HOME}/site/git/code_share/Images/logos/mambo.jpg" "${HOME}/Documents/mambo.jpg"
ln "${HOME}/site/git/code_share/Images/logos/wallpaper.jpg" "${HOME}/Documents/wallpaper.jpg"
ln "${HOME}/site/git/code_share/Images/logos/maksym_patiiuk.jpg" "${HOME}/Documents/maksym_patiiuk.jpg"


echo \#\#\# Private part \#\#\#
echo This relies on a private \`maxxxxxdlp/private-dotfiles\` repository
echo You should comment out this part or replace it with your own
echo private repository

(
  cd "${HOME}/site/git/" &&
  git clone https://github.com/maxxxxxdlp/private-dotfiles.git
)
../private-dotfiles/install.sh
