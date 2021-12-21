# .dotfiles

A monorepo containing my `.dotfiles` and `*.rc` dotfiles.

It also contains a handy `install.sh` and reinstall checklist for speeding up
the setup after system reinstall.

All of these files were tested to work on macOS Big Sur and Ubuntu Linux.

## Pre-install

Should do these things before reinstalling the system:

- Back up Google Chrome custom flags along with Stylebot's settings
- Back up files not in git (Downloads, Desktop, ~/, etc)
- Check checkout out git repositories. Make sure:
  - working tree is clean
  - there are no unpushed commits
  - there is no stashed code
  - files that are ignored by git are not important
- Check the content of docker containers and docker volumes

## Installation

Run the main installation script:

```
WARNING:
If you want to give these dotfiles a try, you should first fork this
repository, review the code, and remove things you don’t want or need.
Don’t blindly use my settings unless you know what that entails. Use
at your own risk!
```

```zsh
source <(curl -s https://raw.githubusercontent.com/maxxxxxdlp/dotfiles/main/install.sh)
```

Configure the following terminal shortcuts:

- `Shift+Up` `\033[1;2B`
- `Shift+Down` `\033[1;2A`

Install
[this font](https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf)
and set it as default in the terminal:

Manually import the following extension into Chrome:

- ~/site/git/custom_new_tab_page/

### [macOS only]

Configure `~/site/git/code_share/misc/vim_macos_associator`

Associate `vim` with the files located in `common_plaintext_files`

Download high quality TTS voices

Manually download the following programs:

- Davinchi Resolve
- Adobe Photoshop

### [Ubuntu only]

Configure the terminal to use the same keyboard shortcuts and theme as macOS

Configure Gnome to use a theme/icons/cursors like in macOS
