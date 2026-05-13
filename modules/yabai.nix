{ ... }:

{
  services.yabai.enable = true;
  services.yabai.config = {
    focus_follows_mouse         = "autoraise";
    mouse_follows_focus         = "off";
    window_placement            = "second_child";
    window_opacity              = "off";
    active_window_border_color  = "0xff7fc8ff";
    normal_window_border_color  = "0xff505050";
    window_border               = "on";
    window_border_width         = 4;
    top_padding                 = 36;
    bottom_padding              = 10;
    left_padding                = 10;
    right_padding               = 10;
    window_gap                  = 16;
  };

  services.skhd.enable = true;
  services.skhd.skhdConfig = ''
    # ---- Navigation (niri HJKL) ----
    cmd - h : yabai -m window --focus west
    cmd - j : yabai -m window --focus south
    cmd - k : yabai -m window --focus north
    cmd - l : yabai -m window --focus east

    # ---- Move windows (niri Ctrl+HJKL) ----
    cmd + shift - h : yabai -m window --swap west
    cmd + shift - j : yabai -m window --swap south
    cmd + shift - k : yabai -m window --swap north
    cmd + shift - l : yabai -m window --swap east

    # ---- Move windows across monitors (niri Shift+HJKL) ----
    cmd + alt - h : yabai -m window --display west
    cmd + alt - j : yabai -m window --display south
    cmd + alt - k : yabai -m window --display north
    cmd + alt - l : yabai -m window --display east

    # ---- Workspaces (niri Mod+1..9) ----
    cmd - 1 : yabai -m space --focus 1
    cmd - 2 : yabai -m space --focus 2
    cmd - 3 : yabai -m space --focus 3
    cmd - 4 : yabai -m space --focus 4
    cmd - 5 : yabai -m space --focus 5
    cmd - 6 : yabai -m space --focus 6
    cmd - 7 : yabai -m space --focus 7
    cmd - 8 : yabai -m space --focus 8
    cmd - 9 : yabai -m space --focus 9

    # ---- Move window to workspace (niri Mod+Shift+1..9) ----
    cmd + shift - 1 : yabai -m window --space 1; yabai -m space --focus 1
    cmd + shift - 2 : yabai -m window --space 2; yabai -m space --focus 2
    cmd + shift - 3 : yabai -m window --space 3; yabai -m space --focus 3
    cmd + shift - 4 : yabai -m window --space 4; yabai -m space --focus 4
    cmd + shift - 5 : yabai -m window --space 5; yabai -m space --focus 5
    cmd + shift - 6 : yabai -m window --space 6; yabai -m space --focus 6
    cmd + shift - 7 : yabai -m window --space 7; yabai -m space --focus 7
    cmd + shift - 8 : yabai -m window --space 8; yabai -m space --focus 8
    cmd + shift - 9 : yabai -m window --space 9; yabai -m space --focus 9

    # ---- Close window (niri Mod+Shift+Q) ----
    cmd + shift - q : yabai -m window --close

    # ---- Fullscreen (niri Mod+F) ----
    cmd - f : yabai -m window --toggle zoom-fullscreen

    # ---- Toggle float (niri Mod+V) ----
    cmd + shift - v : yabai -m window --toggle float

    # ---- Center window (niri Mod+C) ----
    cmd + shift - c : yabai -m window --center

    # ---- Balance windows ----
    cmd - b : yabai -m space --balance

    # ---- Launch apps (niri Mod+Return, Mod+Shift+W) ----
    cmd - return : open -a Ghostty
    cmd + shift - w : open -a Firefox
    cmd + shift - period : open -a Finder
  '';

  services.yabai.extraConfig = ''
    yabai -m rule --add app="^Ghostty$" manage=on
    yabai -m rule --add app="^Firefox$" manage=on
    yabai -m rule --add app="^Finder$" manage=off
    yabai -m rule --add app="^System Settings" manage=off
  '';
}
