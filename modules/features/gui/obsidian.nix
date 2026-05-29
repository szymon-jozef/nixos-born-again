{ ... }:

{
  flake.homeModules.obsidian =
    {
      inputs,
      pkgs,
      myConfig,
      ...
    }:
    let
      catppuccin = pkgs.stdenv.mkDerivation {
        pname = "obsidian-catppuccin";
        src = inputs.catppuccin-obsidian;

        dontConfigure = true;
        dontBuild = true;

        installPhase = # bash
          ''
            mkdir -p $out
            cp theme.css manifest.json $out/
          '';
      };
    in
    {

      programs.obsidian = {
        enable = true;

        defaultSettings = {
          app = {
            vimMode = true;
            alwaysUpdateLinks = true;
            attachmentFolderPath = "media";
            newLinkFormat = "relative";
            newFileLocation = "current";
            useMarkdownLinks = true;
            showUnsupportedFiles = true;
            pdfExportSettings = {
              pageSize = "A4";
              landscape = false;
              margin = "0";
              downscalePercent = 100;
            };
          };

          themes = [
            catppuccin
          ];

          corePlugins = [
            "file-explorer"
            "global-search"
            "switcher"
            "graph"
            "backlink"
            "canvas"
            "outgoing-link"
            "tag-pane"
            "page-preview"
            "note-composer"
            "command-palette"
            "editor-status"
            "bookmarks"
            "outline"
            "word-count"
            "bases"
          ];
        };

        vaults = {
          "Notatki-szkolne" = {
            target = "${myConfig.pathConfig.obsidian}/notatki-szkolne";
          };
          "Studia" = {
            target = "${myConfig.pathConfig.obsidian}/ZUT-notatki";
          };
        };
      };
    };
}
