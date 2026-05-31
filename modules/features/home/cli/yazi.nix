{ ... }:
{
  flake.homeModules.programs =
    { config, ... }:
    {
      programs.yazi = {
        enable = true;
        enableFishIntegration = true;
        shellWrapperName = "y";
        settings = {
          mgr = {
            ratio = [
              1
              4
              3
            ];
            sort_by = "alphabetical";
            sort_sensitive = false;
            sort_reverse = false;
            sort_dir_first = true;
            sort_translit = false;
            linemode = "none";
            show_hidden = false;
            show_symlink = true;
            scrolloff = 5;
            mouse_events = [
              "click"
              "scroll"
            ];
            title_format = "Yazi: {cwd}";
          };
        };

        keymap.mgr.prepend_keymap = [
          {
            on = [ "y" ];
            run = [
              "shell -- for path in %s; do echo \"file://$path\"; done | wl-copy -t text/uri-list"
              "yank"
            ];
          }
          {
            on = [
              "g"
              "p"
            ];
            run = "cd ${config.xdg.userDirs.download}";
          }
          {
            on = [
              "g"
              "d"
            ];
            run = "cd ${config.xdg.userDirs.documents}";
          }
          {
            on = [
              "g"
              "v"
            ];
            run = "cd ${config.xdg.userDirs.videos}";
          }
          {
            on = [
              "g"
              "o"
            ];
            run = "cd ${config.xdg.userDirs.pictures}";
          }
          {
            on = [
              "g"
              "k"
            ];
            run = "cd ${config.xdg.userDirs.projects}";
          }
        ];
      };
    };
}
