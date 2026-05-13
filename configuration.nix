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
  services.yabai.enable = true;
  services.yabai.config = {
    focus_follows_mouse = "autoraise";
    mouse_follows_focus = "off";
    window_placement    = "second_child";
    window_opacity      = "off";
    top_padding         = 36;
    bottom_padding      = 10;
    left_padding        = 10;
    right_padding       = 10;
    window_gap          = 10;
  };

  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
