RESET='\e[0m'
GREEN='\e[32m'
YELLOW='\e[33m'
VERBOSE=true

echo_warning() {
    local key="$1"
    local value="$2"

    if test "$VERBOSE" = "true"; then
        printf "${key} %s ${YELLOW}ALREADY EXISTS${RESET}\n" "$value"
    fi
}

echo_created() {
    local key="$1"
    local value="$2"

    if test "$VERBOSE" = "true"; then
        printf "${key} %s ${GREEN}CREATED${RESET}\n" "$value"
    fi
}

ensure_path() {
    local dirs="${1%/*}"

    if test -d "$dirs"; then
        echo_warning 'Path' "$dirs"
        return
    fi

    mkdir -p "$dirs"
    echo_created 'Path' "$dirs"
}

create_symlink() {
    local source_path="$1"
    local dest_path="$2"

    ensure_path "$dest_path"

    if test -L "$dest_path"; then
        echo_warning 'Symlink' "$dest_path"
        return
    fi

    if ln -sfF "$source_path" "$dest_path"; then
        echo_created 'Symlink' "$dest_path"
    fi
}

create_symlink "$DOT_FILES_DIR/borders/bordersrc" "$XDG_CONFIG_HOME/borders/bordersrc"
create_symlink "$DOT_FILES_DIR/git/config" "$XDG_CONFIG_HOME/git/config"
create_symlink "$DOT_FILES_DIR/git/ignore" "$XDG_CONFIG_HOME/git/ignore"
create_symlink "$DOT_FILES_DIR/helix/config.toml" "$XDG_CONFIG_HOME/helix/config.toml"
create_symlink "$DOT_FILES_DIR/helix/themes/nightfox_custom.toml" "$XDG_CONFIG_HOME/helix/themes/nightfox_custom.toml"
create_symlink "$DOT_FILES_DIR/karabiner" "$XDG_CONFIG_HOME/karabiner"
create_symlink "$DOT_FILES_DIR/kitty/kitty.conf" "$XDG_CONFIG_HOME/kitty/kitty.conf"
create_symlink "$DOT_FILES_DIR/nodenv/default-packages" "$XDG_CONFIG_HOME/nodenv/default-packages"
create_symlink "$DOT_FILES_DIR/nvim/after" "$XDG_CONFIG_HOME/nvim/after"
create_symlink "$DOT_FILES_DIR/nvim/init.lua" "$XDG_CONFIG_HOME/nvim/init.lua"
create_symlink "$DOT_FILES_DIR/nvim/lazy-lock.json" "$XDG_CONFIG_HOME/nvim/lazy-lock.json"
create_symlink "$DOT_FILES_DIR/nvim/lua" "$XDG_CONFIG_HOME/nvim/lua"
create_symlink "$DOT_FILES_DIR/nvim/spell/en.utf-8.add" "$XDG_CONFIG_HOME/nvim/spell/en.utf-8.add"
create_symlink "$DOT_FILES_DIR/python/pip.conf" "$XDG_CONFIG_HOME/pip/pip.conf"
create_symlink "$DOT_FILES_DIR/skhd/skhdrc" "$XDG_CONFIG_HOME/skhd/skhdrc"
create_symlink "$DOT_FILES_DIR/starship/starship.toml" "$XDG_CONFIG_HOME/starship/starship.toml"
create_symlink "$DOT_FILES_DIR/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
create_symlink "$DOT_FILES_DIR/yabai/yabairc" "$XDG_CONFIG_HOME/yabai/yabairc"
create_symlink "$DOT_FILES_DIR/zsh/.zshenv" "$XDG_CONFIG_HOME/zsh/.zshenv"
create_symlink "$DOT_FILES_DIR/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh/.zshrc"
create_symlink "$DOT_FILES_DIR/zsh/zshenv" /etc/zshenv
