# Secrets fetched via 1Password CLI — runs once per login shell, not on every pane
export BITBUCKET_ACCESS_TOKEN=$(op read "op://Employee/Bitbucket Access Token/credential")
