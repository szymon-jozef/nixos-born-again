{ self, ... }:
{
  flake.wrappers.nh = { wlib, ... }: {
    imports = [ wlib.wrapperModules.nh ];
    ask = false;
    flake = "/etc/nixos";
    nom = true;
  };

  flake.nixosModules.nh = { config, ... }: {
    imports = [ self.wrappers.nh.install ];

    programs.nh = {
      enable = true;
      package = config.wrappers.nh.wrapper;

      clean = {
        enable = true;
      };
    };
  };
}
