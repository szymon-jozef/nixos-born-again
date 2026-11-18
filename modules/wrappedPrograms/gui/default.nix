{ self, ... }:
{
  flake.nixosModules.wrapped-programs-gui-default = {
    imports = with self.nixosModules; [
      satty
      mako
    ];
  };
}
