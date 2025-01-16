{ pkgs, ... }:

{
  home.username = "noel";
  home.homeDirectory = "/home/noel";

  imports = [
    ../../modules/home-manager/vscode.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/firefox.nix
    ../../modules/home-manager/bash.nix
    ../../modules/home-manager/hyprland.nix
  ];

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    starship
    nerd-fonts.jetbrains-mono
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
    dunst
    libnotify
    grim
    slurp
  ];

  home.file = {
    ".config/starship.toml".source = ../../modules/home-manager/starship.toml;
  };

  home.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };

  programs.home-manager.enable = true;
}
