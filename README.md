## Symlinks

### ~/.config/nvim/
* nvim/init.lua
* nvim/lua
* nvim/after

### ~/.config/karabiner/
* karabiner/

### ~/
* .gitignore
* .gitconfig
* .tmux.conf
* .zshrc
* .kitty.conf

### Example
ln -sfF Users/griffithc/project/dotfiles/nvim/init.lua ~/.config/nvim/init.lua

## macOS Keychain

### create/get key/value from the shell
* security add-generic-password -a "$USER" -s '<key>' -w '<value>'
* security find-generic-password -a "$USER" -s '<key>' -w

### load value into environment variable
export <env_var>=$(security find-generic-password -a "$USER" -s "<key>" -w)

## Brewfile
brew bundle dump -f
