{ self, ... }:

{
  flake.wrappers.yazi = { wlib, ... }: {
    imports = [ wlib.wrapperModules.yazi ];

    settings = {
      theme = fromTOML (builtins.readFile ./theme.toml);

      yazi.mgr = {
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

      keymap = {
        mgr.prepend_keymap = [
          {
            on = [ "y" ];
            run = [
              "shell -- for path in %s; do echo \"file://$path\"; done | wl-copy -t text/uri-list"
              "yank"
            ];
          }
        ];
      };

    };
  };

  flake.nixosModules.yazi =
    { config, ... }:
    let
      home = config.users.users.${config.user.name}.home;
      homePaths = builtins.mapAttrs (name: value: "${home}/${value}") config.paths;
    in
    {
      imports = [ self.wrappers.yazi.install ];

      wrappers.yazi.settings.keymap.mgr.prepend_keymap = [
        {
          on = [
            "g"
            "p"
          ];
          run = "cd ${homePaths.download}";
        }
        {
          on = [
            "g"
            "d"
          ];
          run = "cd ${homePaths.documents}";
        }
        {
          on = [
            "g"
            "v"
          ];
          run = "cd ${homePaths.videos}";
        }
        {
          on = [
            "g"
            "o"
          ];
          run = "cd ${homePaths.pictures}";
        }
        {
          on = [
            "g"
            "k"
          ];
          run = "cd ${homePaths.projects}";
        }
      ];

      wrappers.yazi.enable = true;
    };
}
