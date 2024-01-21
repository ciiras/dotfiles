DOT_FILES_DIR=$HOME/projects/dotfiles

mkdir -p ~/.config/kitty
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/spell
mkdir -p ~/.config/lua
mkdir -p ~/.config/skhd
mkdir -p ~/.config/yabai

ln -sfF $DOT_FILES_DIR/karabiner $XDG_CONFIG_HOME/karabiner
ln -sfF $DOT_FILES_DIR/kitty.conf $XDG_CONFIG_HOME/kitty/kitty.conf
ln -sfF $DOT_FILES_DIR/nvim/after $XDG_CONFIG_HOME/nvim/after
ln -sfF $DOT_FILES_DIR/nvim/init.lua $XDG_CONFIG_HOME/nvim/init.lua
ln -sfF $DOT_FILES_DIR/nvim/lua $XDG_CONFIG_HOME/nvim/lua
ln -sfF $DOT_FILES_DIR/nvim/spell/en.utf-8.add $XDG_CONFIG_HOME/nvim/spell/en.utf-8.add
ln -sfF $DOT_FILES_DIR/skhd/skhdrc $XDG_CONFIG_HOME/skhd/skhdrc
ln -sfF $DOT_FILES_DIR/yabai/yabairc $XDG_CONFIG_HOME/yabai/yabairc

ln -sfF $DOT_FILES_DIR/.amethyst.yml $HOME/.amethyst.yml
ln -sfF $DOT_FILES_DIR/.gitconfig $HOME/.gitconfig
ln -sfF $DOT_FILES_DIR/.gitignore $HOME/.gitignore
ln -sfF $DOT_FILES_DIR/.tmux.conf $HOME/.tmux.conf
ln -sfF $DOT_FILES_DIR/.zshrc $HOME/.zshrc
