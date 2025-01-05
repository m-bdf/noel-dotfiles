{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Monitor configuration
      monitor = [
        ",preferred,auto,1"
      ];

      # Default env vars
      env = [
        "XCURSOR_SIZE,24"
      ];

      # Execute at launch
      exec-once = [
        "waybar"
        "dunst"
      ];

      # Input configuration
      input = {
        kb_layout = "de";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };

      # General window layout and behavior
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee)";
        layout = "dwindle";
      };

      # Basic keybindings
      bind = [
        "SUPER, Return, exec, ghostty"
        "SUPER, Q, killactive"
        "SUPER, M, exit"
        "SUPER, Space, togglefloating"
        "SUPER, D, exec, rofi -show drun"
        # Window focus
        "SUPER, h, movefocus, l"
        "SUPER, l, movefocus, r"
        "SUPER, k, movefocus, u"
        "SUPER, j, movefocus, d"
        # Move windows
        "SUPER SHIFT, h, movewindow, l"
        "SUPER SHIFT, l, movewindow, r"
        "SUPER SHIFT, k, movewindow, u"
        "SUPER SHIFT, j, movewindow, d"
      ];

      # Window rules
      windowrule = [
        "float, ^(pavucontrol)$"
        "float, ^(nm-connection-editor)$"
        "float, ^(rofi)$"
      ];

      decoration = {
        rounding = 8;
        drop_shadow = true;
        shadow_range = 8;
        shadow_offset = "2 2";
      };

      animations = {
        enabled = true;
        animation = [
          "windows, 1, 4, smoothIn, slide"
          "windowsOut, 1, 4, smoothOut, slide"
          "fade, 1, 4, smoothIn"
        ];
      };
    };
  };
}
