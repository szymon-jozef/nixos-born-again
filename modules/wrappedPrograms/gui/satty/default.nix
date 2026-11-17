{ self, ... }:
{
  flake.wrappers.satty = { wlib, ... }: {
    imports = [ wlib.wrapperModules.satty ];
    settings = {
      general = {
        fullscreen = true;
        early-exit = true;
        initial-tool = "crop";
        save-after-copy = true;
        copy-command = "wl-copy";
        disable-notifications = false;
        actions-on-escape = [ "exit" ];
        actions-on-enter = [ "save-to-clipboard" ];
        no-window-decoration = true;
      };

      color-palette = {
        palette = [
          "#00ffff"
          "#a52a2a"
          "#dc143c"
          "#ff1493"
          "#ffd700"
          "#008000"
        ];

        custom = [
          "#00ffff"
          "#a52a2a"
          "#dc143c"
          "#ff1493"
          "#ffd700"
          "#008000"
        ];
      };
    };
  };

  flake.nixosModules.satty = { config, ... }: {
    imports = [ self.wrappers.satty.install ];
    wrappers.satty = {
      enable = true;
      settings.general.output-filename = "~/${config.paths.pictures}/zrzuty/%d-%m-%Y_%H:%M:%S.png";
    };
  };
}
