{ self, ... }:
{
  flake.wrappers.starship = { wlib, ... }: {
    imports = [ wlib.wrapperModules.starship ];
    settings.add_newline = true;
    # TODO! Maybe configure this someday
  };

  flake.nixosModules.starship = { config, ... }: {
    imports = [ self.wrappers.nh.install ];
    package = config.wrappers.starship.wrapper;

    enableFishIntegration = true;
  };
}
