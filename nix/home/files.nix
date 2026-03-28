{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/projects/dotfiles";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
in
{
  xdg.configFile = {
    "aerospace/aerospace.toml"    = { source = link "aerospace/aerospace.toml";    force = true; };
    "bat/themes/nightfox.tmTheme" = { source = link "bat/themes/nightfox.tmTheme"; force = true; };
    "borders/bordersrc"           = { source = link "borders/bordersrc";           force = true; };
    "git/config"                  = { source = link "git/config";                  force = true; };
    "git/ignore"                  = { source = link "git/ignore";                  force = true; };
    "karabiner"                   = { source = link "karabiner";                   force = true; };
    "kitty/kitty.conf"            = { source = link "kitty/kitty.conf";            force = true; };
    "nodenv/default-packages"     = { source = link "nodenv/default-packages";     force = true; };
    "nvim/after"                  = { source = link "nvim/after";                  force = true; };
    "nvim/ftplugin"               = { source = link "nvim/ftplugin";               force = true; };
    "nvim/init.lua"               = { source = link "nvim/init.lua";               force = true; };
    "nvim/lazy-lock.json"         = { source = link "nvim/lazy-lock.json";         force = true; };
    "nvim/lua"                    = { source = link "nvim/lua";                    force = true; };
    "nvim/spell/en.utf-8.add"     = { source = link "nvim/spell/en.utf-8.add";     force = true; };
    "pip/pip.conf"                = { source = link "python/pip.conf";             force = true; };
    "starship/starship.toml"      = { source = link "starship/starship.toml";      force = true; };
    "tmux/tmux.conf"              = { source = link "tmux/tmux.conf";              force = true; };
    "zsh/.zshenv"                 = { source = link "zsh/.zshenv";                 force = true; };
    "zsh/.zshrc"                  = { source = link "zsh/.zshrc";                  force = true; };
  };
}
