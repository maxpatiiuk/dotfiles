# killnessus launchd job

This launchd job runs `script.sh` every 60 seconds to kill root-owned `find` processes spawned by Nessus/perl.

Because the script targets root-owned processes, install the plist as a system LaunchDaemon.

## Enable

```sh
sudo cp uk.patii.max.killnessus.plist /Library/LaunchDaemons/
sudo chown root:wheel /Library/LaunchDaemons/uk.patii.max.killnessus.plist
sudo chmod 644 /Library/LaunchDaemons/uk.patii.max.killnessus.plist
sudo launchctl bootout system /Library/LaunchDaemons/uk.patii.max.killnessus.plist 2>/dev/null || true
sudo launchctl enable system/uk.patii.max.killnessus
sudo launchctl bootstrap system /Library/LaunchDaemons/uk.patii.max.killnessus.plist
```

Check that it is loaded:

```sh
sudo launchctl print system/uk.patii.max.killnessus
```

## Disable

Unload the job:

```sh
sudo launchctl bootout system /Library/LaunchDaemons/uk.patii.max.killnessus.plist
sudo launchctl disable system/uk.patii.max.killnessus
```

Remove the installed plist if you no longer want it available to launchd:

```sh
sudo rm /Library/LaunchDaemons/uk.patii.max.killnessus.plist
```
