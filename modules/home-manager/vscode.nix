{ pkgs }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      esbenp.prettier-vscode
      astro-build.astro-vscode
      rust-lang.rust-analyzer
      ms-python.black-formatter
      github.copilot
      tamasfe.even-better-toml
    ];
    userSettings = {
      "editor.inlineSuggest.enabled" = true;
      "github.copilot.enable" = {
        "*" = true;
        "plaintext" = false;
        "markdown" = false;
        "scminput" = false;
        "yaml" = false;
      };
      "workbench.colorTheme" = "Monokai";
      "workbench.iconTheme" = "eq-material-theme-icons-palenight";
      "editor.fontFamily" = "\"JetBrainsMono NF\"";
      "editor.fontLigatures" = true;
      "git.autofetch" = true;
      "editor.minimap.enabled" = false;
      "terminal.integrated.fontFamily" = "\"JetBrainsMono NF\"";
      "editor.formatOnSave" = true;
      "workbench.sideBar.location" = "right";
      "editor.tabSize" = 2;
      "flake8.args" = [
        "--max-line-length=88"
        "ignore = E501, E402"
        "extend-ignore = E203, W503"
      ];
      "python.analysis.autoImportCompletions" = true;
      "workbench.settings.applyToAllProfiles" = [
        "ltex.language"
      ];
      "ltex.language" = "en-US";
      "ltex.additionalRules.enablePickyRules" = true;
      "ltex.additionalRules.motherTongue" = "de-DE";
      "tailwindCSS.includeLanguages.rs" = "html";
      "cmake.configureOnOpen" = true;
      "git.confirmSync" = false;
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[json]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[latex]" = {
        "editor.defaultFormatter" = "mathematic.vscode-latex";
      };
      "[typescriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[astro]" = {
        "editor.defaultFormatter" = "astro-build.astro-vscode";
      };
      "[rust]" = {
        "editor.defaultFormatter" = "rust-lang.rust-analyzer";
      };
      "[python]" = {
        "editor.defaultFormatter" = "ms-python.black-formatter";
        "editor.codeActionsOnSave" = {
          "source.organizeImports" = "explicit";
        };
        "editor.tabSize" = 4;
      };
      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
        "editor.tabSize" = 2;
      };
      "nix.serverPath" = "nixd";
      "nix.enableLanguageServer" = true;
      "nixpkgs.expr" = "import <nixpkgs> { }";
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = [ "nixfmt" ];
          };
        };
      };
    };
  };
}
