# .dotfiles

A monorepo containing my `.dotfiles` and `*.rc` dotfiles.

It also contains a handy `install.sh` and reinstall checklist for speeding up
the setup after system reinstall.

All of these files were tested to work on macOS Big Sur and Ubuntu Linux.

## Pre-install

Should do these things before reinstalling the system:

- Google Chrome
  - Flags
  - Extensions
    - Stylebot
    - Tampermonkey
    - Calendar Plus
    - others?
- Back up files not in git (Downloads, Desktop, ~/, etc)
- Copy ~/s/git/custom_new_tab_page/imgs
- Check checked out git repositories. Make sure:
  - working tree is clean
  - there are no unpushed commits
  - there is no stashed code
  - files that are ignored by git are not important
    - Back up .vscode directory for main projects
- Check the content of docker containers and docker volumes
- Screenshot system preferences
- Back up iTerm settings
  - Back up Profiles to zsh/iterm2/Default.json
  - Double check that settings (.plist) are being backed up
- Back up Raycast settings
- Go though all installed apps to check if
  - they are in install.sh
  - they have custom settings that need to be exported

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
source <(curl -s https://raw.githubusercontent.com/maxpatiiuk/dotfiles/main/install.sh)
```

Install
[JetBrains Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Ligatures)
and set it as default in the terminal

Manually import the following extension into Chrome:

- ~/s/git/custom_new_tab_page/

### (macOS only)

Configure `~/s/git/code-share/misc/vim_macos_associator`

Associate `vim` with the files located in `common_plaintext_files`

Download high quality TTS voices

Manually download the following programs:

- DaVinci Resolve - via App Store (not available in Homebrew)
- Adobe Photoshop (not available in Homebrew)
- ExpressVPN (Homebrew version crashes)

Configure iTerm to use zsh/iterm2 folder for storing configuration and import
the zsh/iterm2/Deault.json profile

Import Raycast config

### [Ubuntu only]

Configure the terminal to use the same keyboard shortcuts and theme as macOS

Configure Gnome to use a theme/icons/cursors like in macOS

Configure the following terminal shortcuts:

- `Shift+Up` `\033[1;2B`
- `Shift+Down` `\033[1;2A`
