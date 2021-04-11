# WARNING!
# Read the contents of this file carefully before running it


# Config
USER="/Users/mambo"

# replace git config
rm "${USER}/.gitconfig"
ln ./git/.gitconfig "${USER}/.gitconfig"
git config --global core.excludesfile "${USER}/site/git/dotfiles/git/.gitignore_global"

# Create directories
mkdir "${USER}/site/"
mkdir "${USER}/site/git/"
mkdir "${USER}/site/python/"
mkdir "${USER}/site/javascript/"
mkdir "${USER}/site/misc/"
mkdir "${USER}/site/haskell/"

# Hardlink JavaScript dotfiles
ln ./javascript/.eslintignore "${USER}/site/"
ln ./javascript/.eslintrc.js "${USER}/site/"
ln ./javascript/.jshintrc "${USER}/site/"
ln ./javascript/.prettierrc.js "${USER}/site/"
ln ./javascript/package.json "${USER}/site/"
ln ./javascript/stylelint.config.js "${USER}/site/"

# Hardlink Python dotfiles
ln ./python/.pylintrc "${USER}/site/"

# Hardlink Vim files
ln ./vim/.vimrc "${USER}/"

# Hardlink other files
ln ./.gitconfig "${USER}/"

# Hardlink Zsh files
ln ./zsh/.zshrc "${USER}/"
ln ./zsh/.oh-my-zsh/ku.zsh "${USER}/.oh-my-zsh/custom/"
ln ./zsh/.oh-my-zsh/osx.zsh "${USER}/.oh-my-zsh/custom/"
ln ./zsh/.oh-my-zsh/git.zsh "${USER}/.oh-my-zsh/custom/"
ln ./zsh/.oh-my-zsh/misc.zsh "${USER}/.oh-my-zsh/custom/"
ln ./zsh/.oh-my-zsh/dirs.zsh "${USER}/.oh-my-zsh/custom/"
ln ./zsh/.oh-my-zsh/specify.zsh "${USER}/.oh-my-zsh/custom/"
ln ./zsh/.oh-my-zsh/programs.zsh "${USER}/.oh-my-zsh/custom/"
ln ./zsh/.oh-my-zsh/dirhistory.plugin.zsh "${USER}/.oh-my-zsh/custom/"

# Clonning git repos
(
	cd "${USER}/site/python" &&
	git clone https://github.com/specify/specify7
)
(
	cd "${USER}/site/git/" &&
	git clone https://github.com/specify/specify6 &&
	git clone https://github.com/specify/specify_tools &&
	git clone https://github.com/maxxxxxdlp/code_share &&
	git clone https://github.com/maxxxxxdlp/TTS_King &&
	# this is a private repository, so you should probably comment out
	# this line:
	git clone https://github.com/maxxxxxdlp/private-dotfiles
)

# Hardlink common files from `code_share`
ln "${USER}/site/git/code_share/Images/logos/mambo.jpg" "${USER}/Documents/mambo.jpg"
ln "${USER}/site/git/code_share/Images/logos/wallpaper.jpg" "${USER}/Documents/wallpaper.jpg"
ln "${USER}/site/git/code_share/Images/logos/maksym_patiiuk.jpg" "${USER}/Documents/maksym_patiiuk.jpg"

# This relies on the `private-dotfiles`. You shou probably comment i
# out
# Running the install script for `private-dotfiles`
../private-dotfiles/install.sh

