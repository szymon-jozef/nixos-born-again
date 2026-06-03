{ ... }:

{
  flake.modules.homeManager.gui =
    {
      config,
      ...
    }:
    let
      obsidian_dir = "${config.xdg.userDirs.documents}/obsidian";
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
            target = "${obsidian_dir}/notatki-szkolne";
          };
          "Studia" = {
            target = "${obsidian_dir}/ZUT-notatki";
          };
        };
      };
    };
}
