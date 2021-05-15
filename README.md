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

Add `\033[1;2B` and `\033[1;2A` to the termial's keyboard settings for
Shift+Up Arrow and Shift+Down Arrow respectively.

Install [this font
](https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf)
and set it as default in the terminal:

Manually import the following extension into Chrome:

* ~/site/git/custom_new_tab_page/

Configure `~/site/git/code_share/Misc/vim_macos_associator`
Associate `vim` with the files located in `common_plaintext_files`

Dissable unneded zsh and oh-my-zsh aliases and shell functions

Download high quality TTS voices

Manually download the following programs:

* Davinchi Resolve
* Adobe Photoshop
