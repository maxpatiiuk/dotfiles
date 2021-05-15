# .dotfiles

A monorepo containing my `.dotfiles` and `*.rc` dotfiles

All of these files were tested to work on macOS Big Sur

It also contains a handly `install.sh` and resintall checklist for
speeeding up the setup after system reinstall

## Pre-install

Should do these things before reinstalling the system:

* Back up Google Chrome custom flags along with Stylebot's settings
* Back up Terminal's custom key bindings
* Back up files not in git (Downloads, Desktop, ~/, etc)
* Check that checked out repositories have clean trees, no unpushed
   commits and no stashed code. Also check files ignored by Git
* Check the content of docker containers and docker volumes

## Installation

Install Chrome Beta

Install some tools and configure hard/symblinks:

```
WARNING:
Read the contents of that file carefully before running it
```

```zsh
source <(curl -s https://raw.githubusercontent.com/maxxxxxdlp/dotfiles/main/install.sh)
```

Manually merge the following files:

* ./zsh/.zshrc ~/.zshrc
* ./zsh/.p10k.zsh and ~/.p10k.zsh
* ./zsh/oh-my-zsh.sh ~/.oh-my-zsh/oh-my-zsh.sh

Manually import the following extension into Chrome:

* ~/site/git/custom_new_tab_page/

Configure `~/site/git/code_share/Misc/vim_macos_associator`
Associate `vim` with the files located in `common_plaintext_files`

Dissable unneded zsh and oh-my-zsh aliases and shell functions

Download high quality TTS voices

Manually download the following programs:

* Davinchi Resolve
* Adobe Photoshop
