{
  config,
  pkgs,
  wlib,
  lib,
  ...
}:
{
  imports = [
    wlib.modules.default
    wlib.modules.systemd
  ];

  options = {
    settings = lib.mkOption {
      type = wlib.types.hyprConfValue;
      default = { };
      description = ''
        Hyprsunset configuration.
        See <https://wiki.hypr.land/hypr-ecosystem/user/hyprsunset/>
      '';
      example = {
        max-gamma = 150;

        profile = [
          {
            time = "7:00";
            identity = true;
          }
          {
            time = "21:30";
            identity = false;
            temperature = 4500;
            gamma = 0.8;
          }
        ];
      };
    };

    "hyprsunset.conf" = lib.mkOption {
      type = wlib.types.file {
        path = lib.mkOptionDefault config.constructFiles.generatedConfig.path;
        content = (
          lib.optionalString (config != { }) (
            wlib.generators.toHyprconf {
              attrs = config.settings;
            }
          )
          + lib.optionalString (config.extraConfig != null) config.extraConfig
        );
      };
    };

    extraConfig = lib.mkOption {
      type = lib.types.nullOr lib.types.lines;
      description = "Additional config to append to the end of the config file.";
      default = null;
    };

    systemdTarget = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      description = "Systemd target to bind to. Set to null to disable systemd service.";
      default = "graphical-session.target";
      example = "hyprland-session.target";
    };
  };

  config = {
    package = pkgs.callPackage ./_package.nix { };
    flags."--config" = config.constructFiles.generatedConfig.path;
    constructFiles.generatedConfig = {
      content = config."hyprsunset.conf".content;
      relPath = "${config.binName}.conf";
    };

    systemd.user.service.hyprsunset = lib.mkIf (config.systemdTarget != null) {
      Install.WantedBy = [ config.systemdTarget ];
      Unit = {
        After = [ config.systemdTarget ];
        ConditionEnvironment = "WAYLAND_DISPLAY";
        PartOf = [ config.systemdTarget ];
        X-Restart-Triggers = [ config.constructFiles.generatedConfig.path ];
      };
    };

    meta = {
      platforms = lib.platforms.linux;
    };
  };

}
