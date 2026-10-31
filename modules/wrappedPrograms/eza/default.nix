{ self, ... }:
{
  flake.wrappers.eza = { wlib, ... }: {
    imports = [ wlib.wrapperModules.eza ];
    appendFlag = [
      "--long"
      "--icons"
      "--group-directories-first"
      "--git"
    ];

    theme = import ./_theme.nix;
  };

  flake.nixosModules.eza = {
    imports = [ self.wrappers.eza.install ];

    wrappers.eza.enable = true;
  };
}
