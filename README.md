## macOS Keychain

### create/get key/value from the shell
* security add-generic-password -a "$USER" -s '<key>' -w '<value>'
* security find-generic-password -a "$USER" -s '<key>' -w

### load value into environment variable
export <env_var>=$(security find-generic-password -a "$USER" -s "<key>" -w)

## Brewfile
brew bundle dump -f
brew bundle --file=./Brewfile

## Python
python3 -m pip freeze > <file>
python3 -m pip install -r <file>
