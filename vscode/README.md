# VS Code

[Custom VSCode css styles](https://github.com/maxpatiiuk/code-share/blob/main/javascript/projects/web-refiner/scripts/vscode.dev/common.css)

## Web Server

I run VS Code from the browser. It is functionally identical.
I prefer it is Chrome tabs are less messy than macOS spaces, and give me more control:

- no transition animation
- can have a browser extension arrange them for me or custom shortcut to go to a precise tab

### Setup

[The LaunchAgent](../scripts/uk.patii.max.vscode-serve-web.plist) runs `code serve-web`
on port `48000` at login.

Create the connection token once and restrict access to it.

```sh
openssl rand -hex 24 > ~/.ssh/vscode-serve-web-token
chmod 600 ~/.ssh/vscode-serve-web-token
```

### Install Or Reload

[The installer](../install.sh) installs and starts the agent. To install it
separately, or reload it after editing the plist:

```sh
mkdir -p ~/Library/LaunchAgents
plutil -lint ~/g/dotfiles/scripts/uk.patii.max.vscode-serve-web.plist
ln -sf ~/g/dotfiles/scripts/uk.patii.max.vscode-serve-web.plist ~/Library/LaunchAgents/
launchctl bootout "gui/$(id -u)/uk.patii.max.vscode-serve-web" 2>/dev/null || true
launchctl enable "gui/$(id -u)/uk.patii.max.vscode-serve-web"
launchctl bootstrap "gui/$(id -u)" ~/Library/LaunchAgents/uk.patii.max.vscode-serve-web.plist
```

### Inspect

Follow output and errors:

```sh
tail -n 100 -f ~/.local/state/vscode-serve-web.log ~/.local/state/vscode-serve-web.error.log
```

Show the process state, PID, and last exit code:

```sh
launchctl print "gui/$(id -u)/uk.patii.max.vscode-serve-web"
```

Errors do not trigger notifications. Logs are appended and are not automatically
rotated.

### Stop

Stop without disabling on future logins:

```sh
launchctl bootout "gui/$(id -u)/uk.patii.max.vscode-serve-web"
```

(use `bootstrap` to reverse)

Prevent automatic loading:

```sh
launchctl disable "gui/$(id -u)/uk.patii.max.vscode-serve-web"
```

(do `enable` to reverse)

### Restart

Restart a loaded agent:

```sh
launchctl kickstart -k "gui/$(id -u)/uk.patii.max.vscode-serve-web"
```
