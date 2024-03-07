createSymLink() {
    local source_path=$1
    local dest_path=$2

    if test -L "$dest_path"; then
        echo "symlink $dest_path already exists"
        return
    fi

    if ln -sfF "$source_path" "$dest_path"; then
        echo "symlink $dest_path CREATED"
    fi
}

if test -L /etc/zshenv; then
    echo "symlink /etc/zshenv already exists"
else
    sudo ln -sfF "$DOT_FILES_DIR/zsh/zshenv" /etc/zshenv
    echo "symlink /zsh/zshenv CREATED"
fi

createSymLink "$DOT_FILES_DIR/borders/bordersrc" "$XDG_CONFIG_HOME/borders/bordersrc"
createSymLink "$DOT_FILES_DIR/git/config" "$XDG_CONFIG_HOME/git/config"
createSymLink "$DOT_FILES_DIR/git/ignore" "$XDG_CONFIG_HOME/git/ignore"
createSymLink "$DOT_FILES_DIR/karabiner" "$XDG_CONFIG_HOME/karabiner"
createSymLink "$DOT_FILES_DIR/kitty/kitty.conf" "$XDG_CONFIG_HOME/kitty/kitty.conf"
createSymLink "$DOT_FILES_DIR/nvim/after" "$XDG_CONFIG_HOME/nvim/after"
createSymLink "$DOT_FILES_DIR/nvim/init.lua" "$XDG_CONFIG_HOME/nvim/init.lua"
createSymLink "$DOT_FILES_DIR/nvim/lazy-lock.json" "$XDG_CONFIG_HOME/nvim/lazy-lock.json"
createSymLink "$DOT_FILES_DIR/nvim/lua" "$XDG_CONFIG_HOME/nvim/lua"
createSymLink "$DOT_FILES_DIR/nvim/spell/en.utf-8.add" "$XDG_CONFIG_HOME/nvim/spell/en.utf-8.add"
createSymLink "$DOT_FILES_DIR/python/pip.conf" "$XDG_CONFIG_HOME/pip/pip.conf"
createSymLink "$DOT_FILES_DIR/skhd/skhdrc" "$XDG_CONFIG_HOME/skhd/skhdrc"
createSymLink "$DOT_FILES_DIR/starship/starship.toml" "$XDG_CONFIG_HOME/starship/starship.toml"
createSymLink "$DOT_FILES_DIR/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
createSymLink "$DOT_FILES_DIR/tmux/scripts/truncate_path.sh" "$XDG_DATA_HOME/tmux/scripts/truncate_path.sh"
createSymLink "$DOT_FILES_DIR/yabai/yabairc" "$XDG_CONFIG_HOME/yabai/yabairc"
createSymLink "$DOT_FILES_DIR/zsh/.zshenv" "$XDG_CONFIG_HOME/zsh/.zshenv"
createSymLink "$DOT_FILES_DIR/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh/.zshrc"
