# WARNING!
# Read the contents of this file carefully before running it

# Config
USER="/Users/mambo"

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

