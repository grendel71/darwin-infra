{ config, pkgs, ... }:

{
  imports = [
    ./modules
  ];

  home.username = "blau";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
