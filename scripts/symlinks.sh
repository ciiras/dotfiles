TEST_TYPE_SYMLINK=-L

createSymLink() {
    local source_path=$1
    local dest_path=$2

    if test $TEST_TYPE_SYMLINK $dest_path; then
        return
    fi

    ln -sfF $source_path $dest_path
}

mkdir -p ~/.config/kitty
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/spell
mkdir -p ~/.config/lua
mkdir -p ~/.config/skhd
mkdir -p ~/.config/yabai

createSymLink $DOT_FILES_DIR/karabiner $XDG_CONFIG_HOME/karabiner
createSymLink $DOT_FILES_DIR/kitty.conf $XDG_CONFIG_HOME/kitty/kitty.conf
createSymLink $DOT_FILES_DIR/nvim/after $XDG_CONFIG_HOME/nvim/after
createSymLink $DOT_FILES_DIR/nvim/init.lua $XDG_CONFIG_HOME/nvim/init.lua
createSymLink $DOT_FILES_DIR/nvim/lua $XDG_CONFIG_HOME/nvim/lua
createSymLink $DOT_FILES_DIR/nvim/spell/en.utf-8.add $XDG_CONFIG_HOME/nvim/spell/en.utf-8.add
createSymLink $DOT_FILES_DIR/skhd/skhdrc $XDG_CONFIG_HOME/skhd/skhdrc
createSymLink $DOT_FILES_DIR/yabai/yabairc $XDG_CONFIG_HOME/yabai/yabairc

createSymLink $DOT_FILES_DIR/.amethyst.yml $HOME/.amethyst.yml
createSymLink $DOT_FILES_DIR/.gitconfig $HOME/.gitconfig
createSymLink $DOT_FILES_DIR/.gitignore $HOME/.gitignore
createSymLink $DOT_FILES_DIR/.tmux.conf $HOME/.tmux.conf
createSymLink $DOT_FILES_DIR/zsh/.zshrc $HOME/.zshrc
