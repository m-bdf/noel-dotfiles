{ pkgs, ... }:

{
  home.username = "noel";
  home.homeDirectory = "/home/noel";

  imports = [
    ../../modules/home-manager/vscode.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/firefox.nix
    ../../modules/home-manager/bash.nix
  ];

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    starship
    nerd-fonts.jetbrains-mono
  ];

  home.file = {
    ".config/starship.toml".source = ../../modules/home-manager/starship.toml;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/noel/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
