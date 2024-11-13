{ inputs }:

{
  programs.firefox = {
    enable = true;
    profiles.noel = {
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        proton-pass
      ];
    };
  };
}
