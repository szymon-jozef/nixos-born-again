{ self, ... }:

{
  flake.wrappers.yazi =
    {
      wlib,
      pkgs,
      lib,
      ...
    }:
    {
      imports = [ wlib.wrapperModules.yazi ];

      plugins = with pkgs.yaziPlugins; {
        git = git;
        mount = mount;
        full-border = full-border;
      };

      initLua =
        # lua
        ''
           require("full-border"):setup()
           Header:children_add(function()
               if ya.target_family() ~= "unix" then
                   return ""
               end
               return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
           end, 500, Header.LEFT)

          require("git"):setup {
               order = 1500,
          }


        '';

      settings = {
        theme = lib.recursiveUpdate (fromTOML (builtins.readFile ./theme.toml)) {
          mgr.sytenct_theme = "${./preview.tmTheme}";
        };

        yazi.plugin = {
          prepend_fetchers = [
            {
              url = "*";
              run = "git";
              group = "git";
            }

            {
              url = "*/";
              run = "git";
              group = "git";
            }
          ];
        };

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

            {
              on = [ "M" ];
              run = [
                "plugin mount"
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
