TEST_TYPE_SYMLINK=-L

createSymLink() {
    local source_path=$1
    local dest_path=$2
    local sudo_cmd=$3

    if test $TEST_TYPE_SYMLINK $dest_path; then
        echo "symlink $dest_path already exists"
        return
    fi

    $sudo_cmd ln -sfF $source_path $dest_path
    echo "symlink $dest_path CREATED"
}

mkdir -p ~/.config/borders
mkdir -p ~/.config/git
mkdir -p ~/.config/kitty
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/spell
mkdir -p ~/.config/lua
mkdir -p ~/.config/skhd
mkdir -p ~/.config/tmux
mkdir -p ~/.config/yabai
mkdir -p ~/.config/zsh

createSymLink $DOT_FILES_DIR/zsh/zshenv /etc/zshenv sudo

createSymLink $DOT_FILES_DIR/borders/bordersrc $XDG_CONFIG_HOME/borders/bordersrc
createSymLink $DOT_FILES_DIR/git/config $XDG_CONFIG_HOME/git/config
createSymLink $DOT_FILES_DIR/git/ignore $XDG_CONFIG_HOME/git/ignore
createSymLink $DOT_FILES_DIR/karabiner $XDG_CONFIG_HOME/karabiner
createSymLink $DOT_FILES_DIR/kitty/kitty.conf $XDG_CONFIG_HOME/kitty/kitty.conf
createSymLink $DOT_FILES_DIR/nvim/after $XDG_CONFIG_HOME/nvim/after
createSymLink $DOT_FILES_DIR/nvim/init.lua $XDG_CONFIG_HOME/nvim/init.lua
createSymLink $DOT_FILES_DIR/nvim/lazy-lock.json $XDG_CONFIG_HOME/nvim/lazy-lock.json
createSymLink $DOT_FILES_DIR/nvim/lua $XDG_CONFIG_HOME/nvim/lua
createSymLink $DOT_FILES_DIR/nvim/spell/en.utf-8.add $XDG_CONFIG_HOME/nvim/spell/en.utf-8.add
createSymLink $DOT_FILES_DIR/skhd/skhdrc $XDG_CONFIG_HOME/skhd/skhdrc
createSymLink $DOT_FILES_DIR/tmux/tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
createSymLink $DOT_FILES_DIR/yabai/yabairc $XDG_CONFIG_HOME/yabai/yabairc
createSymLink $DOT_FILES_DIR/zsh/.zshenv $XDG_CONFIG_HOME/zsh/.zshenv
createSymLink $DOT_FILES_DIR/zsh/.zshrc $XDG_CONFIG_HOME/zsh/.zshrc
