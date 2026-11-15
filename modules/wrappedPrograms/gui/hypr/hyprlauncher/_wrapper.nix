{
  config,
  wlib,
  lib,
  pkgs,
  ...
}:
{
  imports = [ wlib.modules.default ];

  options = {
    settings = lib.mkOption {
      type = wlib.types.hyprConfValue;
      default = { };
      example = {
        cache.enabled = true;

        finders = {
          desktop_icons = true;
          desktop_launch_prefix = "uwsm app --";
        };

        general = {
          grab_focus = true;
        };
      };

      description = ''
        Configuration for hyprlauncher.
        See <https://wiki.hypr.land/hypr-ecosystem/user/hyprlauncher/>
      '';
    };

    "hyprlauncher.conf" = lib.mkOption {
      type = wlib.types.file {
        path = lib.mkOptionDefault config.constructFiles.generatedConfig.path;
        content =
          lib.optionalString (config.settings != { }) (
            wlib.generators.toHyprconf {
              attrs = config.settings;
            }
          )
          + lib.optionalString (config.extraConfig != "") config.extraConfig;
      };
    };

    extraConfig = lib.mkOption {
      type = lib.types.lines;
      default = "";
      example = ''
        source = "/path/to/extra.conf"
      '';
    };
  };

  config = {
    package = lib.mkDefault (pkgs.callPackage ./_package.nix { });
    flags."--config" = config."hyprlauncher.conf".path;

    constructFiles.generatedConfig = {
      content = config."hyprlauncher.conf".content;
      relPath = "${config.binName}.conf";
    };
  };
}
