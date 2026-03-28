{ pkgs, ... }: {
  imports = [
    ./packages.nix
    ./files.nix
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
