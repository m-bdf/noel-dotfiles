{
  pkgs,
  inputs,
  ...
}:

{
  home.username = "noel";
  home.homeDirectory = "/home/noel";

  imports = [
    (import ./../../modules/home-manager/vscode.nix { inherit pkgs; })
    (import ./../../modules/home-manager/git.nix)
    (import ./../../modules/home-manager/firefox.nix { inherit inputs pkgs; })
    (import ./../../modules/home-manager/bash.nix)
    (import ./../../modules/home-manager/hyprland.nix { inherit pkgs; })
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
    ".config/starship.toml".source = ./../../modules/home-manager/starship.toml;
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

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
