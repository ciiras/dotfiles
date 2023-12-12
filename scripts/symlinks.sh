USER_DIR=/Users/$USER
DOT_FILES_DIR=$USER_DIR/projects/dotfiles
XDG_CONFIG_HOME=$USER_DIR/.config

ln -sfF $DOT_FILES_DIR/karabiner $XDG_CONFIG_HOME/karabiner
ln -sfF $DOT_FILES_DIR/kitty.conf $XDG_CONFIG_HOME/kitty/kitty.conf
ln -sfF $DOT_FILES_DIR/nvim/after $XDG_CONFIG_HOME/nvim/after
ln -sfF $DOT_FILES_DIR/nvim/init.lua $XDG_CONFIG_HOME/nvim/init.lua
ln -sfF $DOT_FILES_DIR/nvim/lua $XDG_CONFIG_HOME/nvim/lua

ln -sfF $DOT_FILES_DIR/.gitconfig $USER_DIR/.gitconfig
ln -sfF $DOT_FILES_DIR/.gitignore $USER_DIR/.gitignore
ln -sfF $DOT_FILES_DIR/.tmux.conf $USER_DIR/.tmux.conf
ln -sfF $DOT_FILES_DIR/.zshrc $USER_DIR/.zshrc
ln -sfF $DOT_FILES_DIR/cspell.json $USER_DIR/cspell.json
