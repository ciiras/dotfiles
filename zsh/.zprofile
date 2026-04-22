# op daemon writes its PID file to XDG_RUNTIME_DIR; /run/user/<uid> is
# ephemeral (wiped on reboot) and only re-created by darwin-rebuild switch.
# Point to a persistent path so the daemon can always start.
export XDG_RUNTIME_DIR="${HOME}/.local/run"
mkdir -p "$XDG_RUNTIME_DIR"

export BITBUCKET_ACCESS_TOKEN=$(op read 'op://Employee/Bitbucket Access Token/credential')
export JIRA_ACCESS_TOKEN=$(op read 'op://Employee/Jira Access Token/credential')
