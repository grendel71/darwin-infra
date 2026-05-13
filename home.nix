{ config, pkgs, ... }:

{
  imports = [
    ./modules
  ];

  home.username = "blau";
  home.homeDirectory = "/Users/blau";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
