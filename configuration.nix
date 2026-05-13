{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    htop
    screenfetch
    firefox
    ghostty-bin
    git
  ];

  nix.settings.experimental-features = "nix-command flakes";

  programs.fish.enable = true;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;

  users.users.blau = {
    name = "blau";
    home = "/Users/blau";
  };

  system.primaryUser = "blau";
  imports = [
    ./modules/yabai.nix
  ];
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
