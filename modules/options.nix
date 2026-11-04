{
  flake.commonModules.options =

    { lib, ... }:
    let
      t = lib.types;
    in
    {
      options = {
        user = {
          name = lib.mkOption {
            type = t.str;
            default = "szymon";
          };

          email = lib.mkOption {
            # for git configuration
            type = t.str;
            default = "szymon_jozef@proton.me";
          };
        };

        system = {
          hostname = lib.mkOption {
            type = t.str;
            default = "example-pc";
          };
        };

        monitors = {
          primary = lib.mkOption {
            type = t.str;
            default = "DP-1";
          };
        };

        paths = {
          documents = lib.mkOption {
            type = t.str;
            default = "Dokumenty";
          };

          download = lib.mkOption {
            type = t.str;
            default = "Pobrane";
          };

          pictures = lib.mkOption {
            type = t.str;
            default = "Obrazy";
          };

          videos = lib.mkOption {
            type = t.str;
            default = "Video";
          };

          projects = lib.mkOption {
            type = t.str;
            default = "Kodowanie";
          };
        };
      };
    };
}
