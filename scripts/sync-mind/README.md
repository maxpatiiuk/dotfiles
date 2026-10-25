## Daily Mind Sync

`~g/mind-upload` is my markdown repository (digital twin of my mind).

This launchctl task keeps the local clone in sync between machines.

Trigger a run with `launchctl kickstart "gui/$(id -u)/uk.patii.max.sync-mind"`.
Inspect the job with `launchctl print "gui/$(id -u)/uk.patii.max.sync-mind"`.
Logs append to `~/.local/state/sync-mind.log`. To disable the job, run
`launchctl bootout "gui/$(id -u)/uk.patii.max.sync-mind"`.
